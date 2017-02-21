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
    if "</sqlMap>" not in content:
        return
    logger.info(file_path)
    # result map
    def result_map_replace(m):
        original = m.group(0)
        if "tenant" in original:
            return original
        else:
            return "%s%s\n        %s" % (m.group(1), """<result property="tenant" column="Tenant"/>""", m.group(4))

    content = re.sub(
        r"""(<resultMap\s+id="(\w+)"\s+class="([\w\.]+)">\s*\n\s*)(<result\s+property="(\w+)"\s+column="([\w_]+)"/>)""",
        result_map_replace, content, flags=re.IGNORECASE)
    # select
    # 仅处理返回为resultMap的select
    def select_sql_replace(m):
        original = m.group(0)
        if "Tenant" in original or "@@IDENTITY" in original.upper():
            return original
        else:
            return "%s%sTenant,\n        %s" % (m.group(2) or "", m.group(5) or "", m.group(4) or "")

    def handle_select_block(m):
        block = m.group(0)
        if "resultMap" in block:
            block = re.sub(r"""((\s+select\s+(DISTINCT\s+)?)((\w+\.)?(\w+)))""", select_sql_replace, block,
                           flags=re.IGNORECASE)
        return block

    content = re.sub("<select.*?</select>", handle_select_block, content,
                     flags=re.IGNORECASE | re.MULTILINE | re.DOTALL)
    # where
    def where_sql_replace(m):
        original = m.group(0)
        if "Tenant" in original:
            return original
        else:
            return "%s%sTenant = #tenant#\n        AND %s" % (m.group(2) or "", m.group(4) or "", m.group(3) or "")

    content = re.sub(r"""((\s+where\s+)((\w+\.)?(\w+)))""", where_sql_replace, content, flags=re.IGNORECASE)

    # join
    def join_sql_replace(m):
        original = m.group(0)
        if "Tenant" in original:
            return original
        else:
            return "%s%s.Tenant = #tenant# AND %s" % (m.group(1) or "", m.group(3) or "", m.group(4) or "")

    content = re.sub(r"""(\s+join\s+([\w\.]+(?:\s+as)?)\s+(\w+)\s+on\s+)(\w+)""", join_sql_replace, content,
                     flags=re.IGNORECASE)

    # insert into
    def insert_sql_replace(m):
        original = m.group(0)
        if "Tenant" in original:
            return original
        else:
            return "%s\n\t\t\tTenant,%s\n\t\t\t#tenant#,\n\t\t\t%s" % (
            m.group(1).rstrip(), m.group(3).rstrip(), m.group(5).lstrip())

    content = re.sub(
        r"""(\s+insert\s+into\s+([\w_]+)\s+\()(([\w,_\s]+?)\)\s+values\s*\(\n?)(([\w,_\s#\.(\(\))]+?)\))""",
        insert_sql_replace, content, flags=re.IGNORECASE)
    # update
    # delete
    write_file(file_path, content)

#############
# main
#############
if __name__ == "__main__":
    scan_module(module_name="expense",
                func_match_pattern=is_sql_map_xml,
                func_handler=handle_sql_map_xml)
