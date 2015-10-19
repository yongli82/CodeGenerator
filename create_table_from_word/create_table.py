#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
将表结构说明转换为MySQL建表语句
输入： 文本文件(UTF-8) 格式见word文档

Table: FC_MonthlyBadDebtSummary: 月度坏账汇总

字段   	 类型   	AutoIncr   	Default   	说明
Id   	int(11)   	yes   	   	主键
BusinessType	tinyint(4)	no   	   	业务类型 1团购
BadDebtMonth	Varchar(16)	no		坏账确认月份
CompanyId	Int(11)	No		公司ID
Amount	decimal(10,2)	no	0.00	金额
AddTime 	timestamp  	no   	   	添加时间
UpdateTime 	timestamp  	no   	CURRENT_TIMESTAMP 	更新时间
RecordState 	tinyint(1) 	no 	1 	记录状态 1 有效 2

最后一行以Table: 结束

输出： 建表sql文件
"""

import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

from jinja2 import Template
import re


temp = """
DROP TABLE IF EXISTS `{{table_name}}`;
CREATE TABLE `{{table_name}}` (
    {% for item in columns %}
    {% if item[2] == "yes" %}
    `{{ item[0].strip() }}` {{ item[1] }} NOT NULL AUTO_INCREMENT COMMENT '{{ item[4] }}',
    {% elif item[3].strip() != "" %}
    `{{ item[0].strip()  }}` {{ item[1] }} NOT NULL DEFAULT {{ item[3] }} COMMENT '{{ item[4] }}',
    {% else %}
    `{{ item[0].strip()  }}` {{ item[1] }} COMMENT '{{ item[4] }}',
    {% endif %}
    {% endfor %}
    PRIMARY KEY (`Id`)
) COMMENT '{{ table_comment }}' ENGINE=InnoDB DEFAULT CHARSET=utf8;
"""

t = Template(temp)

lines = []
with open("table.info") as f:
    lines = f.readlines()

table_name = None
table_comment = None
columns = []

create_table_sqls = []

for line in lines:
    line = line.strip()
    if len(line) == 0:
        continue
    if re.match(r"^\d+", line):
        continue
    if line.startswith("Table:"):
        if table_name is not None:
            #create the last table
            print "create table %s" % table_name
            create_table_sql = t.render({'table_name':table_name, 'table_comment':table_comment, 'columns':columns})
            create_table_sql = re.sub(r"^\s*$\n", "", create_table_sql, flags=re.M)
            print create_table_sql
            create_table_sqls.append(create_table_sql)
            print "=" * 60

        values = line.split(":")
        table_name = values[1].strip()
        table_comment = values[2].strip()
        print "Table: " + table_name
    elif line.startswith("字段"):
        columns = []
    else:
        #handle columns
        values = line.split("\t")
        for value in values:
            print value
        print "-" * 60
        columns.append(values)

content = "\n\n".join(create_table_sqls)

with open("table.sql", 'wb') as f:
    f.write(content)
    f.flush()
    f.close()

os.system("table.sql")