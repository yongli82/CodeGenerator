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

project_name = "budget"
data_name = "BudgetReport"
table_name = "FC_BudgetBaseInfo"

searchBeanPackage="com.dianping.ba.finance.budget.api.beans"
searchBeanName="BudgetReportSearchBean"
searchBeanField="""
    private int budgetTypeId;
    private int costDepartmentId;
    private String budgetOwnerNo;
    private boolean exceedBudget;
    private boolean withExpenseType;
    private int beginYear;
    private int beginMonth;
    private int endYear;
    private int endMonth;
"""

dataBeanPackage="com.dianping.ba.finance.budget.api.beans"
dataBeanName="BudgetYearReportDisplayBean"
dataBeanField="""
    private int budgetYear;
    private int budgetTypeId;
    private String budgetTypeNo;
    private String budgetTypeName;
    private int costDepartmentId;
    private String costDepartmentName;
    private String budgetOwnerNo;
    private String budgetOwnerName;
    private int budgetStatus;
    private String budgetStatusName;
    private int budgetPlanId;
    private String budgetPlanNo;
    private int strategyId;
    private int strategyPeriodType;
    private String strategyPeriodTypeName;

    private BigDecimal yearTotalAmount;
    private BigDecimal yearAvailableAmount;
    private BigDecimal yearUsedAmount;
    private BigDecimal yearFrozenAmount;

    private BigDecimal quarterTotalAmount1;
    private BigDecimal quarterAvailableAmount1;
    private BigDecimal quarterUsedAmount1;
    private BigDecimal quarterFrozenAmount1;
    private BigDecimal quarterTotalAmount2;
    private BigDecimal quarterAvailableAmount2;
    private BigDecimal quarterUsedAmount2;
    private BigDecimal quarterFrozenAmount2;
    private BigDecimal quarterTotalAmount3;
    private BigDecimal quarterAvailableAmount3;
    private BigDecimal quarterUsedAmount3;
    private BigDecimal quarterFrozenAmount3;
    private BigDecimal quarterTotalAmount4;
    private BigDecimal quarterAvailableAmount4;
    private BigDecimal quarterUsedAmount4;
    private BigDecimal quarterFrozenAmount4;

    private BigDecimal monthTotalAmount1;
    private BigDecimal monthAvailableAmount1;
    private BigDecimal monthUsedAmount1;
    private BigDecimal monthFrozenAmount1;
    private BigDecimal monthTotalAmount2;
    private BigDecimal monthAvailableAmount2;
    private BigDecimal monthUsedAmount2;
    private BigDecimal monthFrozenAmount2;
    private BigDecimal monthTotalAmount3;
    private BigDecimal monthAvailableAmount3;
    private BigDecimal monthUsedAmount3;
    private BigDecimal monthFrozenAmount3;
    private BigDecimal monthTotalAmount4;
    private BigDecimal monthAvailableAmount4;
    private BigDecimal monthUsedAmount4;
    private BigDecimal monthFrozenAmount4;
    private BigDecimal monthTotalAmount5;
    private BigDecimal monthAvailableAmount5;
    private BigDecimal monthUsedAmount5;
    private BigDecimal monthFrozenAmount5;
    private BigDecimal monthTotalAmount6;
    private BigDecimal monthAvailableAmount6;
    private BigDecimal monthUsedAmount6;
    private BigDecimal monthFrozenAmount6;
    private BigDecimal monthTotalAmount7;
    private BigDecimal monthAvailableAmount7;
    private BigDecimal monthUsedAmount7;
    private BigDecimal monthFrozenAmount7;
    private BigDecimal monthTotalAmount8;
    private BigDecimal monthAvailableAmount8;
    private BigDecimal monthUsedAmount8;
    private BigDecimal monthFrozenAmount8;
    private BigDecimal monthTotalAmount9;
    private BigDecimal monthAvailableAmount9;
    private BigDecimal monthUsedAmount9;
    private BigDecimal monthFrozenAmount9;
    private BigDecimal monthTotalAmount10;
    private BigDecimal monthAvailableAmount10;
    private BigDecimal monthUsedAmount10;
    private BigDecimal monthFrozenAmount10;
    private BigDecimal monthTotalAmount11;
    private BigDecimal monthAvailableAmount11;
    private BigDecimal monthUsedAmount11;
    private BigDecimal monthFrozenAmount11;
    private BigDecimal monthTotalAmount12;
    private BigDecimal monthAvailableAmount12;
    private BigDecimal monthUsedAmount12;
    private BigDecimal monthFrozenAmount12;
"""


columns = yyutil.convert_bean_to_columns(dataBeanField)
search_columns = yyutil.convert_bean_to_columns(searchBeanField)


jinja2_env = CodeGen.getEnvironment("gen4service")
template = jinja2_env.get_template("bean_code_template.md")
#snippet = template.render(table_name=table_name, data_name=data_name, columns=columns)
snippet = template.render(locals())

print snippet

with open(data_name + "_generate.md", 'wb') as f:
    f.write(snippet)
    f.flush()
    f.close()

os.system("open " + data_name + "_generate.md")




