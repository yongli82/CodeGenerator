#!/usr/bin/env python
# -*- coding:utf-8 -*-

import sys

reload(sys)
sys.path.append("..")
sys.setdefaultencoding('utf-8')

from project_util import *

################################################################################
# 业务函数
################################################################################

#############
# 扫描API函数
#############
def is_java_api(file_path, arguments):
    return file_path.endswith("Service.java") and "/api/" in file_path


def scan_java_api_method(file_path, arguments):
    method_list = arguments[0]
    module_name = arguments[1]
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
        method = Method(module_name, package, class_name, method_name, parameters, result_type)
        logger.debug(method)
        method_list.append(method)


#############
# 修改使用API的函数,加上Tenant参数
#############
def is_java_api_usage(file_path, arguments):
    return file_path.endswith(".java")


def modify_java_api_usage(file_path, arguments):
    method_list = arguments[0]
    has_modify = False
    content = read_file(file_path)
    for method in method_list:
        class_name = method.class_name
        default_declare = class_name[0].lower() + class_name[1:]
        declare_list = re.findall(r"(?:(?:private|protected|\s)\s+)%s\s+(\w+);" % class_name, content)
        if default_declare not in declare_list:
            # 为继承的Action做特殊处理
            declare_list.append(default_declare)

        for declare in declare_list:
            method_name = method.method_name
            # 只处理含有tenant参数的函数
            has_tenant = False
            for parameter in method.parameters:
                if "tenant" == parameter[1]:
                    has_tenant = True
                    break
            if not has_tenant:
                break
            matched_list = re.findall(r"(%s\.%s\((.*)\))" % (declare, method_name), content)
            for matched in matched_list:
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
        logger.info("modify file %s" % file_path)
        write_file(file_path, content)

#############
# main
#############
if __name__ == "__main__":
    # budget_method_list = []
    # scan_module(module_name="expense",
    #             func_match_pattern=is_java_api,
    #             func_handler=scan_java_api_method,
    #             args=(budget_method_list, "expense"))
    # 
    # scan_module(module_name="expense",
    #             func_match_pattern=is_java_api_usage,
    #             func_handler=modify_java_api_usage,
    #             args=(budget_method_list, "expense"))
    
    budget_method_list = []
    scan_module(module_name="expense",
                func_match_pattern=is_java_api,
                func_handler=scan_java_api_method,
                args=(budget_method_list, "expense"))

    scan_module(module_name="workflow",
                func_match_pattern=is_java_api_usage,
                func_handler=modify_java_api_usage,
                args=(budget_method_list, "workflow"))
