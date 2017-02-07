#!/usr/bin/env python
# -*- coding:utf-8 -*-

import os

import sys

reload(sys)
sys.path.append("..")
sys.setdefaultencoding('utf-8')

import logging
from sqlalchemy import schema
from sqlalchemy.engine import create_engine
from jinja2 import Environment, PackageLoader, Template
import json

logging.basicConfig(level=logging.INFO,
                    format='%(filename)s[%(lineno)d]%(message)s',
                    datefmt='%a, %d %b %Y %H:%M:%S',
                    stream=sys.stdout)


def get_table_info_map(jdbc_url):
    # engine = create_engine("mysql://aspnet_dianping:dp!@OpQW34bn@192.168.7.104:3306/BAFSAccounting")
    # engine = create_engine("mysql://FSSettle:dp!@YahdlkU06@10.66.7.32:3306/DianPingBA_FSSettle")
    engine = create_engine(jdbc_url)
    metadata = schema.MetaData(bind=engine, reflect=True)

    table_names = []
    for table in metadata.sorted_tables:
        table_name = str(table.name)
        table_names.append(table_name)
        print table_name

    table_info_map = {}
    for table_name in table_names:
        table_info = get_table_info(metadata, table_name)
        table_info_map[table_name] = table_info

    return table_info_map


def get_table_info_map2(jdbc_url, database):
    # engine = create_engine("mysql://aspnet_dianping:dp!@OpQW34bn@192.168.7.104:3306/BAFSAccounting")
    # engine = create_engine("mysql://FSSettle:dp!@YahdlkU06@10.66.7.32:3306/DianPingBA_FSSettle")
    table_info_map = {}
    engine = create_engine(jdbc_url)
    sql = "select TABLE_NAME, COLUMN_NAME, COLUMN_TYPE, COLUMN_DEFAULT, IS_NULLABLE, COLUMN_COMMENT  from information_schema.COLUMNS where table_schema='%s' order by TABLE_NAME, ORDINAL_POSITION;" % database
    connection = engine.connect()
    result = connection.execute(sql)
    for row in result:
        table_name = row['TABLE_NAME']
        column = {
            "name": row['COLUMN_NAME'],
            "type": row['COLUMN_TYPE'],
            "default": row['COLUMN_DEFAULT'],
            "nullable": row['IS_NULLABLE'],
            "comment": row['COLUMN_COMMENT'],
        }

        table_info = table_info_map.get(table_name, None)
        if table_info is None:
            columns = []
            columns.append(column)
            table_info = {
                "table_name": table_name,
                "columns": columns
            }
            table_info_map[table_name] = table_info
        else:
            columns = table_info["columns"]
            columns.append(column)
    connection.close()

    return table_info_map


def get_table_info(metadata, table_name):
    table = metadata.tables[table_name]
    columns = []
    for column in table.columns:
        columns.append({
            'name': column.name,
            'type': column.type,
            'nullable': column.nullable,
            'default': column.default,
            'comment': "",
        })
    table_info = dict(table_name=table_name, columns=columns)
    return table_info


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


def generate_file(env, variables, mapping):
    destination = Template(mapping.target_file).render(variables)
    template = env.get_template(mapping.template_file)
    source = template.render(variables)
    if not os.path.exists(os.path.dirname(destination)):
        os.makedirs(os.path.dirname(destination))
    with open(destination, 'wb') as f:
        f.write(source)
    logging.info("Generate file: %s" % destination)


def append_file(env, variables, mapping):
    destination = Template(mapping.target_file).render(variables)
    template = env.get_template(mapping.template_file)
    source = template.render(variables)
    logging.info(source)
    if not os.path.exists(os.path.dirname(destination)):
        os.makedirs(os.path.dirname(destination))
    with open(destination, 'ab') as f:
        f.write(source)
    logging.info("Generate file: %s" % destination)


class Mapping(object):
    ACTION_CREATE = "create"
    ACTION_INSERT = "insert"
    ACTION_APPEND = "append"

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


def generate(mapping_list, variables):
    env = getEnvironment("generate_db_doc")
    for mapping in mapping_list:
        logging.info(mapping)
        if mapping.action == Mapping.ACTION_INSERT:
            insert_content_template(env, variables, mapping)
        elif mapping.action == Mapping.ACTION_CREATE:
            generate_file(env, variables, mapping)
        elif mapping.action == Mapping.ACTION_APPEND:
            append_file(env, variables, mapping)


if __name__ == "__main__":
    jdbc_url = "mysql://aspnet_dianping:dp!@OpQW34bn@10.1.77.21:3306/BAFSBudget"
    database = "BAFSBudget"
    table_info_map = get_table_info_map2(jdbc_url=jdbc_url, database=database)
    mapping_list = [
        Mapping(target_file="output/{{ database }}.md", template_file="database.md", action=Mapping.ACTION_APPEND),
    ]

    for table_name, table_info in table_info_map.items():
        # if table_name != "FS_ExpenseBaseInfo":
        #     continue
        logging.info("table:%s" % table_name)
        variables = {}
        variables["database"] = database
        variables.update(table_info)
        generate(mapping_list, variables)
