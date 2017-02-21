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
def is_sql_map_xml(file_path, arguments):
    return file_path.endswith(".xml") and "/sqlmap/" in file_path


def handle_sql_map_xml(file_path, arguments):
    content = read_file(file_path)
    class_set = arguments[0]
    if "</sqlMap>" not in content:
        return
    logger.info(file_path)
    # result map
    class_list = re.findall(r"""<typeAlias\s+.*?\s*type="([\w\.]+)"/>""", content, flags=re.I)
    for class_name in class_list:
        logger.info(class_name)
        class_set.add(class_name)
    class_list = re.findall(r"""<resultMap\s+.*?\s*class="([\w\.]+)">""", content, flags=re.I)
    for class_name in class_list:
        if "." in class_name:
            logger.info(class_name)
            class_set.add(class_name)


def is_data_bean(file_path, arguments):
    if file_path.endswith(".java"):
        start_pos = file_path.find("com/dianping/ba/")
        if start_pos < 0:
            return False
        class_set = arguments[0]
        class_name = file_path[start_pos:-5].replace("/", ".")
        if class_name in class_set:
            logger.info("[DATA_BEAN] %s" % class_name)
            return True
        else:
            return False
    return False


def handle_data_bean(file_path, arguments):
    content = read_file(file_path)
    if "extends DataBase" in content:
        return
    logger.info("**************Handle %s " % file_path)
    matched = re.findall("((public\s+class\s+\w+)([\s\w]+\{))", content)[0]
    line = matched[0]
    content = content.replace(line, "%s extends DataBase %s" % (matched[1], matched[2]))
    content = content.replace("implements Serializable", "")
    content = content.replace("\n", "\n\nimport com.dianping.ba.finance.expense.api.base.DataBase;\n", 1)
    write_file(file_path, content)

#############
# main
#############
if __name__ == "__main__":
    data_bean_set = set()
    scan_module(module_name="expense",
                func_match_pattern=is_sql_map_xml,
                func_handler=handle_sql_map_xml,
                args=(data_bean_set,))

    scan_module(module_name="expense",
                func_match_pattern=is_data_bean,
                func_handler=handle_data_bean,
                args=(data_bean_set,))
