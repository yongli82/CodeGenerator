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

import ExcelUtil
from jinja2 import Template
import re


temp = """
DROP TABLE IF EXISTS `{{table_name}}`;
CREATE TABLE `{{table_name}}` (
    {% for item in columns %}
    {% if item[2] == "yes" %}
    `{{ item[0].strip() }}` {{ item[1] }} NOT NULL AUTO_INCREMENT COMMENT '{{ item[4] }}',
    {% elif item[3].strip() != "" %}
    `{{ item[0].strip() }}` {{ item[1] }} NOT NULL DEFAULT {{ item[3] }} COMMENT '{{ item[4] }}',
    {% else %}
    `{{ item[0].strip()  }}` {{ item[1] }} COMMENT '{{ item[4] }}',
    {% endif %}
    {% endfor %}
    PRIMARY KEY (`Id`),
    {% for key in keys %}
    {{ key }},
    {% endfor %}
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '{{ table_comment }}' ENGINE=InnoDB DEFAULT CHARSET=utf8;
"""

t = Template(temp)

table_name = None
table_comment = None
columns = []

create_table_sqls = []

columns = ExcelUtil.generate_columns('A', 'F')
print columns
data_grid = ExcelUtil.read_excel_with_head(u"财务账务表.xlsx", u"表", columns)

start_columns = False


def create_table():
    global columns
    if table_name is not None:
        # create the last table
        print "create table %s" % table_name
        keys = []
        if has_column("OutBizId") and has_column("BusinessSource") and has_column("BusinessType"):
            keys.append("UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`)")
        if has_column("CustomerId"): keys.append("KEY IX_CustomerId(`CustomerId`)")
        if has_column("SchemaId"): keys.append("KEY IX_SchemaId(`SchemaId`)")
        if has_column("ShopId"): keys.append("KEY IX_ShopId(`ShopId`)")
        if has_column("DailyId"): keys.append("KEY IX_DailyId(`DailyId`)")
        if has_column("MonthlyId"): keys.append("KEY IX_MonthlyId(`MonthlyId`)")
        if has_column("DetailId"): keys.append("KEY IX_DetailId(`DetailId`)")
        create_table_sql = t.render({'table_name': table_name, 'table_comment': table_comment, 'columns': columns, 'keys': keys})
        create_table_sql = re.sub(r"^\s*$\n", "", create_table_sql, flags=re.M)
        #print create_table_sql
        create_table_sqls.append(create_table_sql)
        #print "=" * 60
        columns = []

def has_column(column_name):
    global columns
    for column in columns:
        if column[0] == column_name:
            return True

    return False

table_postfix_list = []
table_postfix_list.append("")
for year in [2015, 2016]:
    for month in range(1, 13, 1):
        table_postfix = "_%s%02d" % (year, month)
        table_postfix_list.append(table_postfix)

for table_postfix in table_postfix_list:
    for record in data_grid:
        #字段   	 类型   	AutoIncr   	Default   	说明
        column_name = str(record.get(u"字段")).strip()
        column_type = str(record.get(u"类型")).strip().lower()
        column_auto = str(record.get(u"AutoIncr")).strip()
        column_default = str(record.get(u"Default")).strip()
        column_desc = str(record.get(u"说明")).strip()

        if table_name is None and not column_name.startswith("Table:"):
            continue

        if column_name.startswith("Table:"):
            if start_columns:
                create_table()
            start_columns = False
            values = column_name.split(":")
            table_name = values[1].strip()
            table_comment = values[2].strip()
            table_name = table_name + table_postfix
            print "Table: " + table_name
        elif u"字段" in column_name:
            columns = []
            start_columns = True
        elif start_columns:
            #handle columns
            if column_name.strip() == "" or re.match(r"^\d+", column_name):
                start_columns = False
                #if has_column("BusinessType") and not has_column("BusinessSource"):
                #    columns.insert(1, ("BusinessSource", "tinyint(4)", "no", "0", "数据来源: 1天玑 2账务 3结算 4推广 5支付中心"))
                create_table()
            else:
                if column_name == "BusinessType":
                    column_desc = "业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝"
                    column_type = 'tinyint(4)'
                    column_default = "0"
                elif column_name == "BusinessSource":
                    column_desc = "数据来源: 1天玑 2账务 3结算 4推广 5支付中心"
                    column_type = 'tinyint(4)'
                    column_default = "0"
                elif column_name == "UpdateTime":
                    column_desc = "更新时间"
                    column_default = 'CURRENT_TIMESTAMP'
                    column_type = 'timestamp'
                elif column_name == "AddTime":
                    column_desc = "创建时间"
                    column_default = "'0000-00-00 00:00:00'"
                    column_type = 'timestamp'
                elif column_name == "RecordStatus":
                    column_desc = "记录状态: 1 有效, 2 无效"
                    column_default = "1"
                    column_type = 'tinyint(4)'
                elif column_name.lower() == "id":
                    column_auto = "yes"
                    column_name = "Id"
                    column_desc = "主键"
                    column_type = 'int(11)'
                elif "int" in column_type.lower() and column_default == "":
                    column_default = "0"
                elif "timestamp" == column_type.lower() and column_default == "":
                    column_default = "'0000-00-00 00:00:00'"

                columns.append((column_name, column_type, column_auto, column_default, column_desc))


content = "\n\n".join(create_table_sqls)

with open("table.sql", 'wb') as f:
    f.write(content)
    f.flush()
    f.close()

os.system("open table.sql")