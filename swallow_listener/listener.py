#!/usr/bin/python
# -*- coding: utf-8 -*-


import os
import sys

reload(sys)
sys.path.append("..")
sys.setdefaultencoding('utf-8')

import logging
from jinja2 import Environment, PackageLoader, Template
import json

logging.basicConfig(level=logging.INFO,
                    format='%(filename)s[%(lineno)d]%(message)s',
                    datefmt='%a, %d %b %Y %H:%M:%S',
                    stream=sys.stdout)

class Mapping(object):
    ACTION_CREATE = "create"
    ACTION_INSERT = "insert"

    def __init__(self, target_file, template_file, action=ACTION_CREATE, before=None, after=None):
        self.target_file = target_file
        self.template_file = template_file
        self.action = action
        self.before = before
        self.after = after

    def __repr__(self):
        return json.dumps(self.__dict__)


def insert_content_template(env, variables, mapping):
    file_path = Template(mapping.target_file).render(variables)
    insert = env.get_template(mapping.template_file).render(variables)

    content = open(file_path).read()

    if insert.strip() in content:
        logging.info("File: %s already have content." % file_path)
        return

    if mapping.before:
        index = content.find(mapping.before)
        content = content[0:index] + insert + content[index:]

    if mapping.after:
        index = content.find(mapping.after)
        content = content[0:index + len(mapping.after)] + insert + content[index + len(mapping.after):]

    with open(file_path, 'wb') as f:
        f.write(content)
    logging.info("Insert file: %s" % file_path)


def generate_file(env, variables, mapping):
    destination = Template(mapping.target_file).render(variables)
    template = env.get_template(mapping.template_file)
    source = template.render(variables)
    if not os.path.exists(os.path.dirname(destination)):
        os.makedirs(os.path.dirname(destination))
    with open(destination, 'wb') as f:
        f.write(source)
    logging.info("Generate file: %s" % destination)


def upper0(input):
    if input:
        output = input[0:1].upper() + input[1:]
        return output
    else:
        return input


def lower0(input):
    if input:
        output = input[0:1].lower() + input[1:]
        return output
    else:
        return input


def getEnvironment(package):
    env = Environment(loader=PackageLoader(package, 'templates'))
    env.filters['lower0'] = lower0
    env.filters['upper0'] = upper0
    return env


def generate(mapping_list, variables):
    env = getEnvironment(os.path.basename(os.path.dirname(__file__)))
    for mapping in mapping_list:
        logging.info(mapping)
        if mapping.action == mapping.ACTION_INSERT:
            insert_content_template(env, variables, mapping)
        elif mapping.action == mapping.ACTION_CREATE:
            generate_file(env, variables, mapping)


def get_project_info():
    author = "Yang Yongli"
    project_name = "ba-finance-leopard-accounting"
    project_base_dir = "/Users/yangyongli/Projects/ba-finance-leopard-accounting"
    project_package = "com.dianping.ba.finance.leopard.accounting"
    service_uri_context = "leopardAccountingService"
    project_package_path = project_package.replace(".", "/")
    api_project_dir = os.path.join(project_base_dir, "%s-api" % project_name)
    biz_project_dir = os.path.join(project_base_dir, "%s-biz" % project_name)
    service_project_dir = os.path.join(project_base_dir, "%s-service" % project_name)
    web_project_dir = os.path.join(project_base_dir, "%s-web" % project_name)
    mq_project_dir = os.path.join(project_base_dir, "%s-mq" % project_name)
    api_java_dir = os.path.join(api_project_dir, "src/main/java/", project_package_path, "api")
    biz_java_dir = os.path.join(biz_project_dir, "src/main/java/", project_package_path, "biz")
    biz_test_dir = os.path.join(biz_project_dir, "src/test/java/", project_package_path, "biz")
    mq_java_dir = os.path.join(mq_project_dir, "src/main/java/", project_package_path, "mq")
    mq_test_dir = os.path.join(mq_project_dir, "src/test/java/", project_package_path, "mq")
    api_resources_dir = os.path.join(api_project_dir, "src/main/resources")
    biz_resources_dir = os.path.join(biz_project_dir, "src/main/resources")
    mq_resources_dir = os.path.join(mq_project_dir, "src/main/resources")
    service_resources_dir = os.path.join(service_project_dir, "src/main/resources")
    web_resources_dir = os.path.join(web_project_dir, "src/main/resources")

    return locals()


def get_generate_mapping():
    mapping_list = [
        Mapping(target_file="{{ mq_java_dir }}/listener/{{ topic_name }}Listener.java", template_file="Listener.java",
                action=Mapping.ACTION_CREATE),
        Mapping(target_file="{{ mq_test_dir }}/listener/{{ topic_name }}ListenerTest.java", template_file="ListenerTest.java",
                action=Mapping.ACTION_CREATE),
        Mapping(target_file="{{ mq_resources_dir }}/config/spring/local/appcontext-consumer.xml",
                template_file="appcontext-consumer.xml", action=Mapping.ACTION_INSERT, before="</beans>"),

        Mapping(target_file="{{ mq_resources_dir }}/config/spring/local/appcontext-producer.xml",
                template_file="appcontext-producer.xml", action=Mapping.ACTION_INSERT, before="</beans>"),
        Mapping(target_file="{{ mq_test_dir }}/client/{{ topic_name }}ClientTest.java", template_file="ClientTest.java",
                action=Mapping.ACTION_CREATE),
    ]

    return mapping_list

def get_topic_info():
    topic_name = "Payment"
    mq_message_dto = "PaymentMessageDTO"
    topic_lion = "ba-finance-leopard-accounting-mq.payment.listener.topic"
    customer_id_lion="ba-finance-leopard-accounting-mq.customer.id"

    return locals()

if __name__ == "__main__":
    project_info = get_project_info()
    mapping_list = get_generate_mapping()
    topic_info = get_topic_info()

    variables = {}
    variables.update(project_info)
    variables.update(topic_info)
    generate(mapping_list, variables)
