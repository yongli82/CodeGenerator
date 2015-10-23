#!/usr/bin/python
# -*- coding: utf-8 -*-

text=u"""
{
  "businessSource": 1,
  "businessType": 1,
  "outBizId": "PY1445496001786",
  "paymentTypeId": 1,
  "customerId": 1000,
  "customerName": "测试客户1000",
  "schemaId": 1234,
  "schemaName": "合同1234567789",
  "shopId": 123456,
  "shopName": "大众Dianping易园店",
  "companyId": 2,
  "payChannel": 1,
  "payEntityId": 1,
  "paymentDate": 1445496001786,
  "amount": 1234.56,
  "token": "S5JDFGKDKJDFG9KERIERUIEKJKEIINK",
  "extendInfoList": [
    {
      "name": "点评",
      "value": "吃喝玩乐"
    },
    {
      "name": "大众",
      "value": "大众神车"
    }
  ]
}
"""

javastr = text.replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r")
print '"' + javastr + '"'
