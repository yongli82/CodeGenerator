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
import json
import CodeGen



if __name__ == "__main__":
    pageinfo = json.load(open("pageinfo.json"))
    print pageinfo
    jinja2_env = CodeGen.getEnvironment("codegen")
    ftl_template = jinja2_env.get_template("ftl_template.ftl")
    ftl_page = ftl_template.render(pageinfo)
    print ftl_page

    js_template = jinja2_env.get_template("js_template.js")
    js_file = js_template.render(pageinfo)
    print js_file

