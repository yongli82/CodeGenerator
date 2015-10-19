#!/usr/bin/python
# -*- coding: utf-8 -*-


import os
import sys
reload(sys)
sys.path.append("..")
sys.setdefaultencoding('utf-8')

from jinja2 import Environment
from jinja2 import Template
import re
from sqlalchemy import schema, types
from sqlalchemy.engine import create_engine
import yyutil
import CodeGen


#engine = create_engine("mysql://purchase:dp!@c04SWYUVG@192.168.7.104:3306/BAFSPurchase")
engine = create_engine("mysql://aspnet_dianping:dp!@OpQW34bn@192.168.7.104:3306/DianpingBA_FSAccounting")
metedata = schema.MetaData(bind=engine, reflect=True)

table_names = []
print "-" * 80
print "Show all tables' name:"
for table in metedata.sorted_tables:
    table_names.append(table.name)
    print table.name
print "-" * 80


table_name = "FC_RevenueCostMonthSummary" #sys.argv[1]
if not table_name in table_names:
    print "[ERROR] table name %s is not in the database." % table_name
    sys.exit(1)


table = metedata.tables[table_name]
columns = []
for column in table.columns:
    columns.append({
        'name': column.name, 
        'java_name' : yyutil.lower_first(column.name), 
        'type': column.type, 
        'java_type' : yyutil.convert_db_type_to_java(str(column.type))
        })

data_name = table_name.replace("FC_", "")

jinja2_env = CodeGen.getEnvironment("gen4db")
template = jinja2_env.get_template("code_template.md")
snippet = template.render(table_name=table_name, data_name=data_name, columns=columns)

print snippet

with open(data_name + "_generate.md", 'wb') as f:
    f.write(snippet)
    f.flush()
    f.close()

os.system("open " + data_name + "_generate.md")




