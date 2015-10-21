#!/usr/bin/env python
# -*- coding:utf-8 -*-


import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

import ExcelUtil
from jinja2 import Template
import re

def get_table_list():
    column_headers = ExcelUtil.generate_columns('A', 'F')
    data_grid = ExcelUtil.read_excel_with_head(u"财务账务表.xlsx", u"表", column_headers)
    start_columns = False

