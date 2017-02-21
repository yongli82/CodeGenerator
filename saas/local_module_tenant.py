#!/usr/bin/env python
# -*- coding:utf-8 -*-

import os
import re

import sys

reload(sys)
sys.path.append("..")
sys.setdefaultencoding('utf-8')

import logging
from collections import defaultdict

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
                if ("/api/" in file_path or "messages" in file_path) and filename.endswith("Service.java"):
                    handle_service_api_java(file_path, method_list)
                elif filename.endswith("Dao.java"):
                    handle_dao_java(file_path, method_list)
                elif filename.endswith("POMapper.java"):
                    handle_pomapper_java(file_path, method_list)
                elif filename.endswith("Data.java") and filename.endswith("PO.java"):
                    handle_data_java(file_path, method_list)
                elif filename.endswith("ServiceObject.java") or filename.endswith("ServiceImpl.java"):
                    handle_service_object_java(file_path, method_list)
                # elif "/siteweb/" in file_path and filename.endswith("Service.java"):
                #     handle_inner_service_java(file_path, method_list)
                # elif "-web/" in file_path and filename.endswith("Service.java"):
                #     handle_inner_service_java(file_path, method_list)
                # elif "/handlers/" in file_path and filename.endswith("Handler.java"):
                #     handle_inner_service_java(file_path, method_list)
                elif filename.endswith("Test.java"):
                    handle_test_java(file_path, method_list)


def read_file(file_path):
    with open(file_path, 'rb') as f:
        content = f.read()
        return content
    return ""


def write_file(file_path, content):
    with open(file_path, 'wb') as f:
        f.write(content)
        f.flush()


def handle_service_api_java(file_path, method_list):
    """
    处理API函数定义
    :param file_path: 
    :param method_list: 
    :return:
    """
    has_modify = False
    content = read_file(file_path)
    package = re.findall(r"package\s+([\w\.]+);", content)[0]
    class_name_list = re.findall(r"public\s+(?:interface)\s+(\w+)\s*\{", content)
    if not class_name_list:
        return
    class_name = class_name_list[0]
    method_define_list = re.findall(r"((?:public\s+)?([\w<>]+)\s+(\w+)\(([^\)]*)\)\s*(throws .*?)?;)", content)
    for method_define in method_define_list:
        result_type = method_define[1]
        method_name = method_define[2]
        parameter_str = method_define[3]
        parameters = re.findall(r"([\w<>]+)\s+(\w+)\s*", parameter_str)
        has_tenant = False
        for parameter in parameters:
            if "tenant" == parameter[1]:
                has_tenant = True
                break
        if not has_tenant:
            old_method = method_define[0]
            parameters.insert(0, ("String", "tenant"))
            if parameter_str.strip() == "":
                new_parameter_str = "String tenant"
            else:
                new_parameter_str = "String tenant, " + parameter_str
            new_method = old_method.replace("(%s)" % parameter_str, "(%s)" % new_parameter_str, 1)
            logger.info("[TENANT]%s" % new_method)
            has_modify = True
            content = content.replace(old_method, new_method)

        method = Method(package, class_name, method_name, parameters, result_type)
        logger.debug(method)
        method_list.append(method)
    if has_modify:
        write_file(file_path, content)


def handle_dao_java(file_path, method_list):
    """
    处理DAO函数定义
    :param file_path: 
    :param method_list: 
    :return:
    """
    has_modify = False
    content = read_file(file_path)
    package = re.findall(r"package\s+([\w\.]+);", content)[0]
    class_name_list = re.findall(r"public\s+(?:interface)\s+(\w+)\s+extends\s+GenericDao\s*\{", content)
    if not class_name_list:
        return
    class_name = class_name_list[0]
    # 在模式中的*操作符后面加上?修饰符,使得匹配变成非贪婪模式，从而得到最短的匹配
    # 修改模式字符串，增加对换行的支持,在这个模式中， (?:.|\n) 指定了一个非捕获组
    method_define_list = re.findall(r"((?:public\s+)?([\w<>,\s]+)\s+(\w+)\(((?:.|\n)*?)\)\s*;)", content, re.MULTILINE)
    for method_define in method_define_list:
        result_type = method_define[1]
        method_name = method_define[2]
        parameter_str = method_define[3]
        parameters = re.findall(r"(?:@DAOParam\(\"(\w+)\"\))\s*([\w<>,\s]+)\s+(\w+)\s*", parameter_str)
        has_tenant = False
        for parameter in parameters:
            if "tenant" == parameter[2]:
                has_tenant = True
                break
        if not has_tenant:
            old_method = method_define[0]
            parameters.insert(0, ("tenant", "String", "tenant"))
            if parameter_str.strip() == "":
                new_parameter_str = "@DAOParam(\"tenant\") String tenant"
            else:
                new_parameter_str = "@DAOParam(\"tenant\") String tenant, " + parameter_str
            new_method = old_method.replace("(%s)" % parameter_str, "(%s)" % new_parameter_str, 1)
            logger.info("[TENANT]%s" % new_method)
            has_modify = True
            content = content.replace(old_method, new_method)

        method = Method(package, class_name, method_name, parameters, result_type)
        logger.debug(method)
        method_list.append(method)
    if has_modify:
        write_file(file_path, content)


def handle_pomapper_java(file_path, method_list):
    """
    处理pomapper函数定义
    :param file_path: 
    :param method_list: 
    :return:
    """
    has_modify = False
    content = read_file(file_path)
    package = re.findall(r"package\s+([\w\.]+);", content)[0]
    class_name_list = re.findall(r"public\s+(?:interface)\s+(\w+)\s*\{", content)
    if not class_name_list:
        return
    class_name = class_name_list[0]
    # 在模式中的*操作符后面加上?修饰符,使得匹配变成非贪婪模式，从而得到最短的匹配
    # 修改模式字符串，增加对换行的支持,在这个模式中， (?:.|\n) 指定了一个非捕获组
    method_define_list = re.findall(r"((?:public\s+)?([\w<>,\s]+)\s+(\w+)\(((?:.|\n)*?)\)\s*;)", content, re.MULTILINE)
    for method_define in method_define_list:
        result_type = method_define[1]
        method_name = method_define[2]
        parameter_str = method_define[3]
        if "@Param" not in parameter_str:
            continue

        parameters = re.findall(r"(?:@Param\(\"(\w+)\"\))\s*([\w<>,\s]+)\s+(\w+)\s*", parameter_str)
        method = Method(package, class_name, method_name, parameters, result_type)
        logger.debug(method)
        method_list.append(method)
        
        has_tenant = False
        for parameter in parameters:
            if "tenant" == parameter[2]:
                has_tenant = True
                break
        if not has_tenant:
            old_method = method_define[0]
            parameters.insert(0, ("tenant", "String", "tenant"))
            if parameter_str.strip() == "":
                new_parameter_str = "@Param(\"tenant\") String tenant"
            else:
                new_parameter_str = "@Param(\"tenant\") String tenant, " + parameter_str
            new_method = old_method.replace("(%s)" % parameter_str, "(%s)" % new_parameter_str, 1)
            logger.info("[TENANT]%s" % new_method)
            has_modify = True
            content = content.replace(old_method, new_method)

    if has_modify:
        write_file(file_path, content)


def handle_data_java(file_path, method_list):
    """
    处理数据类
    :param file_path: 
    :param method_list: 
    :return:
    """
    content = read_file(file_path)
    if "extends DataBase" in content:
        return
    matched = re.findall("((public\s+class\s+\w+)([\s\w]+\{))", content)[0]
    line = matched[0]
    content = content.replace(line, "%s extends DataBase %s" % (matched[1], matched[2]))
    content = content.replace("implements Serializable", "")
    content = content.replace("\n", "\n\nimport com.dianping.ba.finance.core.payment.api.base.DataBase;\n", 1)
    write_file(file_path, content)


def handle_test_java(file_path, method_list):
    has_modify = False
    content = read_file(file_path)
    if "private String tenant = ExpenseConstant.DEFAULT_TENANT_ID" in content:
        return
    else:
        has_modify = True
        content = content.replace("import org.junit.Test;",
                                  "import com.dianping.ba.finance.expense.api.constants.ExpenseConstant;\nimport org.junit.Test;",
                                  1)
        content = content.replace("Test {", "Test {\n    private String tenant = ExpenseConstant.DEFAULT_TENANT_ID;")

    if has_modify:
        write_file(file_path, content)


def handle_service_object_java(file_path, method_list):
    """
    处理Service实现
    :param file_path: 
    :param method_list: 
    :return:
    """
    has_modify = False
    content = read_file(file_path)
    # 函数定义可能有throws Exception
    method_define_list = re.findall(
        r"((?:(?:public|private|protected)\s+)([\w<>,\s]+)\s+(\w+)\(([^\)]*)\)\s*(?:\{|throws))", content)
    for method_define in method_define_list:
        result_type = method_define[1]
        method_name = method_define[2]
        parameter_str = method_define[3]
        if method_name.startswith("set") or method_name in ["doInTransaction", "run", "compare", "onSuccess", "onFailure", "valueOf"]:
            # setter/getter不需要加租户
            continue
        if method_name.startswith("get") and len(parameter_str.strip()) == 0:
            continue

        parameters = re.findall(r"([\w<>\s]+)\s+(\w+)\s*", parameter_str)
        has_tenant = False
        for parameter in parameters:
            if "tenant" == parameter[1]:
                has_tenant = True
                break
        if not has_tenant:
            # 修改声明
            parameters.insert(0, ("String", "tenant"))
            if parameter_str.strip() == "":
                new_parameter_str = "String tenant"
            else:
                new_parameter_str = "String tenant, " + parameter_str
            old_method = method_define[0]
            new_method = old_method.replace("(%s)" % parameter_str, "(%s)" % new_parameter_str, 1)
            logger.info("[TENANT]%s" % new_method)
            has_modify = True
            content = content.replace(old_method, new_method)
        # 修改本文件中的函数调用
        # 不能与声明冲突
        local_matched_list = re.findall(r"[\s=\(]((?:this\.)?%s\((.*)\);)" % (method_name), content)
        for matched in local_matched_list:
            usage = matched[0]
            param = matched[1]
            if "tenant" not in param:
                has_modify = True
                if "" == param.strip():
                    new_param = "tenant"
                else:
                    new_param = "tenant, " + param
                new_usage = usage.replace("(%s)" % param, "(%s)" % new_param, 1)
                logger.info("[REPLACE] %s -----> %s" % (usage, new_usage))
                content = content.replace(usage, new_usage)

    if has_modify:
        write_file(file_path, content)


def handle_inner_service_java(file_path, method_list):
    """
    处理没有接口的Service实现
    :param file_path: 
    :param method_list: 
    :return:
    """
    has_modify = False
    content = read_file(file_path)
    package = re.findall(r"package\s+([\w\.]+);", content)[0]
    class_name_list = re.findall(r"public\s+(?:class)\s+(\w+)\s*\{", content)
    if not class_name_list:
        return
    class_name = class_name_list[0]
    method_define_list = re.findall(
        r"((?:(?:public|private|protected)\s+)([\w<>,\s]+)\s+(\w+)\((.*)\)\s*(?:\{|throws))", content)
    for method_define in method_define_list:
        result_type = method_define[1]
        method_name = method_define[2]
        parameter_str = method_define[3]
        if method_name.startswith("set") or method_name in ["doInTransaction", "run", "compare", "load", "call"]:
            # setter/getter不需要加租户
            continue
        if method_name.startswith("get") and parameter_str.strip() == "":
            continue
        parameters = re.findall(r"([\w<>\s]+)\s+(\w+)\s*", parameter_str)
        has_tenant = False
        for parameter in parameters:
            if "tenant" == parameter[1] or "CacheKey" == parameter[0]:
                has_tenant = True
                break
        if not has_tenant:
            # 修改声明
            parameters.insert(0, ("String", "tenant"))
            if parameter_str.strip() == "":
                new_parameter_str = "String tenant"
            else:
                new_parameter_str = "String tenant, " + parameter_str
            old_method = method_define[0]
            new_method = old_method.replace("(%s)" % parameter_str, "(%s)" % new_parameter_str, 1)
            logger.info("[TENANT]%s" % new_method)
            has_modify = True
            content = content.replace(old_method, new_method)
        # 修改本文件中的函数调用
        local_matched_list = re.findall(r"[\s=\(]((?:this\.)?%s\((.*)\))" % (method_name), content)
        for matched in local_matched_list:
            usage = matched[0]
            param = matched[1]
            if "tenant" not in param:
                has_modify = True
                if "" == param.strip():
                    new_param = "tenant"
                else:
                    new_param = "tenant, " + param
                new_usage = usage.replace("(%s)" % param, "(%s)" % new_param, 1)
                logger.info("[REPLACE] %s -----> %s" % (usage, new_usage))
                content = content.replace(usage, new_usage)
        method = Method(package, class_name, method_name, parameters, result_type)
        logger.debug(method)
        method_list.append(method)
    if has_modify:
        write_file(file_path, content)


def handle_java_usage(file_path, method_list, usage_list):
    has_modify = False
    content = read_file(file_path)
    for method in method_list:
        class_name = method.class_name
        declare_list = re.findall(r"(?:(?:private|protected|\s)\s+)%s\s+(\w+);" % class_name, content)
        for declare in declare_list:
            method_name = method.method_name
            matched_list = re.findall(r"(%s\.%s\((.*)\))" % (declare, method_name), content)
            for matched in matched_list:
                # logger.info("[usage for %s.%s] %s" % (class_name, method_name, matched[0]))
                usage_list[method].append(matched)
                usage = matched[0]
                param = matched[1]
                if "tenant" not in param:
                    has_modify = True
                    if "" == param.strip():
                        new_param = "tenant"
                    else:
                        new_param = "tenant, " + param
                    new_usage = usage.replace("(%s)" % param, "(%s)" % new_param, 1)
                    content = content.replace(usage, new_usage)
    if has_modify:
        write_file(file_path, content)


def find_api_usage_list(arg, dirname, files):
    """
    查询API的使用情况
    :param arg: (method_list, usage_list)
    :param dirname: 
    :param files: 
    :return:
    """
    method_list = arg[0]
    usage_list = arg[1]
    for filename in files:
        file_path = os.path.join(dirname, filename)
        if os.path.isfile(file_path):
            if filename.endswith(".java"):
                handle_java_usage(file_path, method_list, usage_list)


def scan_project(project_dir):
    method_list = []
    os.path.walk(project_dir, handle_file, (method_list,))
    # for method in method_list:
    #     print method

    usage_list = defaultdict(list)
    os.path.walk(project_dir, find_api_usage_list, (method_list, usage_list))
    # parse_java_usage("/Users/yangyongli/Projects/ba-finance-budget/ba-finance-budget-biz/src/main/java/com/dianping/ba/finance/budget/biz/impl/BudgetExecutePlanDomainServiceObject.java", method_list, usage_list)


if __name__ == "__main__":
    scan_project(r"/Users/yangyongli/Projects/ba-finance-core-payment")
