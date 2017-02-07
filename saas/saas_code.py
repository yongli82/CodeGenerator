#!/usr/bin/env python
# -*- coding:utf-8 -*-

import os

import sys
import re
reload(sys)
sys.path.append("..")
sys.setdefaultencoding('utf-8')

import logging
logging.basicConfig(level=logging.INFO,
                    format='%(filename)s[%(lineno)d]%(message)s',
                    datefmt='%a, %d %b %Y %H:%M:%S',
                    stream=sys.stdout)

logger = logging.getLogger("saas")

class Method(object):
    def __init__(self, package, class_name, method_name, parameters, result_type):
        self.package = package
        self.class_name = class_name
        self.method_name = method_name
        self.result_type = result_type
        self.parameters = parameters or []

    def __repr__(self):
        return "%s.%s#%s(%s)" % (self.package, self.class_name, self.method_name, len(self.parameters))


def handle_file(arg, dirname, files):
    method_list = arg[0]
    for filename in files:
        file_path = os.path.join(dirname, filename)
        if os.path.isfile(file_path):
            if filename.endswith(".java"):
                logger.info(file_path)
                if filename.endswith("Service.java"):
                    parse_service_java(file_path, method_list)

def read_file(file_path):
    with open(file_path, 'rb') as f:
        content = f.read()
        return content
    return ""

def parse_service_java(file_path, method_list):
    content = read_file(file_path)
    package = re.findall(r"package\s+([\w\.]+);", content)[0]
    class_name = re.findall(r"public\s+(?:(?:interface)|(?:class))\s+(\w+)\s+\{", content)[0]
    method_define_list = re.findall(r"(?:public\s+)?([\w<>]+)\s+(\w+)\(([^\)]*)\)\s*;", content)
    for method_define in method_define_list:
        result_type = method_define[0]
        method_name = method_define[1]
        parameter_str = method_define[2]
        parameters = re.findall(r"([\w<>]+)\s+(\w+)\s*", parameter_str)
        method = Method(package, class_name, method_name, parameters, result_type)
        logger.debug(method)
        method_list.append(method)


def scan_project(project_dir):
    method_list = []
    os.path.walk(project_dir, handle_file, (method_list,))
    for method in method_list:
        print method
    
if __name__ == "__main__":
    scan_project(r"/Users/yangyongli/Projects/ba-finance-budget")