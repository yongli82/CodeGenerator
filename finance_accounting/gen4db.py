#!/usr/bin/python
# -*- coding: utf-8 -*-


import os
import sys
reload(sys)
sys.path.append("..")
sys.setdefaultencoding('utf-8')

import logging
from sqlalchemy import schema
from sqlalchemy.engine import create_engine
from finance_accounting import yyutil
import re
from jinja2 import Environment, PackageLoader, Template
import json

logging.basicConfig(level=logging.INFO,
                    format='%(filename)s[%(lineno)d]%(message)s',
                    datefmt='%a, %d %b %Y %H:%M:%S',
                    stream=sys.stdout)

system_table_names = ['FC_AccountingAccessToken',
                        'FC_AccountingDimensionConfig',
                        'FC_CollectionType',
                        'FC_JeHistory',
                        'FC_PaymentType'
                        ]

def get_table_info_map():
    engine = create_engine("mysql://aspnet_dianping:dp!@OpQW34bn@192.168.7.104:3306/BAFSAccounting")
    metadata = schema.MetaData(bind=engine, reflect=True)

    table_names = []
    for table in metadata.sorted_tables:
        table_name = str(table.name)
        if not re.search(r"\d+$", table_name):
            table_names.append(table_name)
            print table_name

    table_info_map = {}
    for table_name in table_names:
        table_info = get_table_info(metadata, table_name)
        table_info_map[table_name] = table_info

    return table_info_map

def get_table_info(metadata, table_name):
    table = metadata.tables[table_name]
    columns = []
    for column in table.columns:
        columns.append({
            'name': column.name,
            'java_name' : yyutil.lower_first(column.name),
            'type': column.type,
            'java_type' : yyutil.convert_db_type_to_java(str(column.type))
            })

    data_name = table_name.replace("FC_", "")
    table_info = dict(table_name=table_name, data_name=data_name, columns=columns)
    return table_info

def get_project_info():
    project_name = "ba-finance-leopard-accounting"
    project_base_dir = "/Users/yangyongli/Projects/ba-finance-leopard-accounting"
    project_package = "com.dianping.ba.finance.leopard.accounting"
    project_package_path = project_package.replace(".", "/")
    api_project_dir = os.path.join(project_base_dir, "%s-api" % project_name)
    biz_project_dir = os.path.join(project_base_dir, "%s-biz" % project_name)
    service_project_dir = os.path.join(project_base_dir, "%s-service" % project_name)
    web_project_dir = os.path.join(project_base_dir, "%s-web" % project_name)
    mq_project_dir = os.path.join(project_base_dir, "%s-mq" % project_name)
    api_java_dir = os.path.join(api_project_dir, "src/main/java/", project_package_path, "api")
    biz_java_dir = os.path.join(biz_project_dir, "src/main/java/", project_package_path, "biz")
    api_resources_dir = os.path.join(api_project_dir, "src/main/resources/")
    biz_resources_dir = os.path.join(biz_project_dir, "src/main/resources/")
    sqlmap_config_dir = os.path.join(biz_project_dir, "src/main/resources/config/sqlmap/")

    return locals()

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

def get_generate_mapping():
    mapping_list = [
        Mapping(target_file="{{ biz_resources_dir }}/config/sqlmap/sqlmap-config.xml", template_file="sqlmap-config.xml", action=Mapping.ACTION_INSERT, before="</sqlMapConfig>"),
        Mapping(target_file="{{ biz_resources_dir }}/config/sqlmap/{{ data_name }}/{{ data_name }}.xml", template_file="data_name.xml", action=Mapping.ACTION_CREATE),
    ]

    return mapping_list

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
    env = getEnvironment("finance_accounting")
    for mapping in mapping_list:
        logging.info(mapping)
        if mapping.action == mapping.ACTION_INSERT:
            insert_content_template(env, variables, mapping)
        elif mapping.action == mapping.ACTION_CREATE:
            generate_file(env, variables, mapping)


if __name__ == "__main__":
    project_info = get_project_info()
    mapping_list = get_generate_mapping()
    table_info_map = get_table_info_map()
    for table_name, table_info in table_info_map.items():
        if table_name not in system_table_names:
            continue
        logging.info("table:%s" % table_name)
        variables = {}
        variables.update(project_info)
        variables.update(table_info)
        generate(mapping_list, variables)
