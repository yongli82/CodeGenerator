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
def is_pom_xml(file_path, arguments):
    return file_path.endswith("/pom.xml")


def handle_pom_xml(file_path, arguments):
    content = read_file(file_path)
    content = content.replace("""<parent>
        <artifactId>ba-finance-expense</artifactId>
        <groupId>com.dianping</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>""", """<parent>
        <artifactId>ba-finance-expense</artifactId>
        <groupId>com.dianping</groupId>
        <version>2.0.1-SNAPSHOT</version>
    </parent>""")
    
    content = content.replace("""<dependency>
            <groupId>com.dianping</groupId>
            <artifactId>ba-finance-expense-api</artifactId>
            <version>1.0.1-SNAPSHOT</version>
        </dependency>""", """<dependency>
            <groupId>com.dianping</groupId>
            <artifactId>ba-finance-expense-api</artifactId>
            <version>2.0.1-SNAPSHOT</version>
        </dependency>""")
    
    content = content.replace("""<dependency>
            <groupId>com.dianping</groupId>
            <artifactId>ba-finance-expense-api</artifactId>
            <version>1.0.1-SNAPSHOT</version>
        </dependency>""", """<dependency>
            <groupId>com.dianping</groupId>
            <artifactId>ba-finance-expense-api</artifactId>
            <version>2.0.1-SNAPSHOT</version>
        </dependency>""")
        

#############
# main
#############
if __name__ == "__main__":
    scan_module(module_name="expense",
                func_match_pattern=is_pom_xml,
                func_handler=handle_pom_xml)
