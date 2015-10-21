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
import copy


system_table_names = ['FC_AccountingAccessToken',
'FC_AccountingDimensionConfig',
'FC_CollectionType',
'FC_JeHistory',
'FC_PaymentType'
]

class TableColumn(object):
    def __init__(self, column_name, column_type, column_auto, column_default, column_desc):
        self.column_name = column_name.strip()
        self.column_type = column_type.strip()
        self.column_auto = column_auto.strip()
        self.column_default = column_default.strip()
        self.column_desc = column_desc.strip()

class TableInfo(object):
    def __init__(self, table_name, table_comment, columns=[]):
        self.table_name = table_name
        self.table_comment = table_comment
        self.columns = columns
        self.keys = []

    def has_column(self, column_name):
        for column in self.columns:
            if column.column_name == column_name:
                return True
        return False

    def create_keys(self):
        self.keys = []
        if self.has_column("OutBizId") and self.has_column("BusinessSource") and self.has_column("BusinessType"):
            self.keys.append("UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`)")
        if self.has_column("CustomerId"): self.keys.append("KEY IX_CustomerId(`CustomerId`)")
        if self.has_column("SchemaId"): self.keys.append("KEY IX_SchemaId(`SchemaId`)")
        if self.has_column("ShopId"): self.keys.append("KEY IX_ShopId(`ShopId`)")
        if self.has_column("DailyId"): self.keys.append("KEY IX_DailyId(`DailyId`)")
        if self.has_column("MonthlyId"): self.keys.append("KEY IX_MonthlyId(`MonthlyId`)")
        if self.has_column("DetailId"): self.keys.append("KEY IX_DetailId(`DetailId`)")

    def render(self):
        self.create_keys()
        temp = """
DROP TABLE IF EXISTS `{{table_name}}`;
CREATE TABLE `{{table_name}}` (
    {% for item in columns -%}
    {% if item.column_auto == "yes" -%}
    `{{ item.column_name }}` {{ item.column_type }} NOT NULL AUTO_INCREMENT COMMENT '{{ item.column_desc }}',
    {% elif item.column_default != "" -%}
    `{{ item.column_name }}` {{ item.column_type }} NOT NULL DEFAULT {{ item.column_default }} COMMENT '{{ item.column_desc }}',
    {% else -%}
    `{{ item.column_name  }}` {{ item.column_type }} COMMENT '{{ item.column_desc }}',
    {% endif -%}
    {% endfor -%}
    PRIMARY KEY (`Id`),
    {% for key in keys -%}
    {{ key }},
    {% endfor -%}
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '{{ table_comment }}' ENGINE=InnoDB DEFAULT CHARSET=utf8;
"""
        t = Template(temp)
        sql = t.render(self.__dict__)
        return sql

    def copy(self):
        return copy.copy(self)


def create_table_postfix():
    table_postfix_list = []
    for year in [2015]:
        for month in range(10, 11, 1):
            table_postfix = "_%s%02d" % (year, month)
            table_postfix_list.append(table_postfix)
    return table_postfix_list

def read_table_info_from_excel(excel_file=u"财务账务表.xlsx", sheet=u"表"):
    columns = ExcelUtil.generate_columns('A', 'F')
    data_grid = ExcelUtil.read_excel_with_head(excel_file, sheet, columns)
    start_columns = False
    columns = []
    table_info_list = []
    table_name = None
    column_name = None
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
                table_info_list.append(TableInfo(table_name, table_comment, columns))
            start_columns = False
            values = column_name.split(":")
            table_name = values[1].strip()
            table_comment = values[2].strip()
        elif u"字段" in column_name:
            columns = []
            start_columns = True
        elif start_columns:
            #handle columns
            if column_name.strip() == "" or re.match(r"^\d+", column_name):
                start_columns = False
                #if has_column("BusinessType") and not has_column("BusinessSource"):
                #    columns.insert(1, ("BusinessSource", "tinyint(4)", "no", "0", "数据来源: 1天玑 2账务 3结算 4推广 5支付中心"))
                table_info_list.append(TableInfo(table_name, table_comment, columns))
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

                columns.append(TableColumn(column_name, column_type, column_auto, column_default, column_desc))
    return table_info_list

def write_file(table_sqls, file_name):
    content = "\n\n".join(table_sqls, )
    with open(file_name, 'wb') as f:
        f.write(content)
        f.flush()
        f.close()
    os.system("open %s" % file_name)

def create_table_sqls():
    monthly_table_sqls = []
    system_table_sqls = []
    table_info_list = read_table_info_from_excel()
    table_postfix_list = create_table_postfix()
    for table_info in table_info_list:
        if table_info.table_name in system_table_names:
            sql = table_info.render()
            system_table_sqls.append(sql)
        else:
            for postfix in table_postfix_list:
                monthly_table_info = table_info.copy()
                monthly_table_info.table_name = monthly_table_info.table_name + postfix
                sql = monthly_table_info.render()
                monthly_table_sqls.append(sql)

    write_file(monthly_table_sqls, "monthly_table.sql")
    write_file(system_table_sqls, "system_table.sql")


create_table_sqls()
