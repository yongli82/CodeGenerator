#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

from jinja2 import Template
import re

def lower_first(name):
	if len(name) == 0:
		return name
	return name[0].lower() + name[1:]

def upper_first(name):
	if len(name) == 0:
		return name
	return name[0].upper() + name[1:]

def convert_db_type_to_java(dbtype):
	if dbtype.startswith('INTEGER') or dbtype.startswith("TINYINT"):
		return "int"
	if dbtype.startswith('VARCHAR'):
		return "String"
	if dbtype.startswith('TEXT'):
		return "String"
	if dbtype.startswith('DECIMAL'):
		return "BigDecimal"
	if dbtype.startswith('TIMESTAMP'):
		return "Date"
	return dbtype


