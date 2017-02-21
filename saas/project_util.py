#!/usr/bin/env python
# -*- coding:utf-8 -*-

import sys
import os

reload(sys)
sys.path.append("..")
sys.setdefaultencoding('utf-8')

import logging
import re

logging.basicConfig(level=logging.INFO,
                    format='%(filename)s[%(lineno)d]%(message)s',
                    datefmt='%a, %d %b %Y %H:%M:%S',
                    stream=sys.stdout)

logger = logging.getLogger("saas")

################################################################################
# 基础函数
################################################################################

class Method(object):
    def __init__(self, module, package, class_name, method_name, parameters, result_type):
        self.module = module
        self.package = package
        self.class_name = class_name
        self.method_name = method_name
        self.result_type = result_type
        self.parameters = parameters or []

    def __repr__(self):
        return "[%s]%s.%s#%s(%s)" % (self.module, self.package, self.class_name, self.method_name, len(self.parameters))


def get_module_path(module):
    base_path = r"/Users/yangyongli/Projects"
    modules = {
        "budget": "ba-finance-budget",
        "expense": "ba-finance-expense",
        "workflow": "ba-finance-workflow",
    }
    module_path = "%s/%s" % (base_path, modules.get(module, "ba-finance-%s" % module))
    logger.info("[module path] %s" % module)
    return module_path


def scan_module(module_name, func_match_pattern, func_handler, args=()):
    """
    扫描模块
    :param module_name: 模块
    :param func_match_pattern: 文件匹配函数, func(file_path, args): true|false, 对返回为true的函数执行func_handler处理
    :param func_handler: 文件处理函数, func(file_path, args)
    :param args: 传入的一个元组参数, 可以将method_list等参数封装在其中,在文件匹配和处理函数中使用
    :return:
    """
    project_dir = get_module_path(module_name)
    def handle_file(arguments, dir_name, files):
        """
        文件遍历处理函数
        :param arguments: 元组参数
        :param dir_name: 目录
        :param files: 文件名
        :return:
        """
        for filename in files:
            file_path = os.path.join(dir_name, filename)
            if os.path.isfile(file_path):
                if func_match_pattern(file_path, arguments):
                    func_handler(file_path, arguments)

    os.path.walk(project_dir, handle_file, args)

def read_file(file_path):
    with open(file_path, 'rb') as f:
        content = f.read()
        return content
    return ""


def write_file(file_path, content):
    with open(file_path, 'wb') as f:
        f.write(content)
        f.flush()
        
