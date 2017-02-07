### FC_BudgetBaseInfo

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetTypeId | int(11) | &nbsp; | NO | 关联预算项目Id |
| CostDepartmentId | int(11) | &nbsp; | NO | 承担部门Id |
| OwnerNo | varchar(11) | &nbsp; | NO | 预算Owner LoginId |
| RecordStatus | tinyint(4) | 1 | NO | 状态 1 有效 2 无效 |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人Id |
| UpdateLoginId | varchar(32) | &nbsp; | YES | 更新人Id |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| Tenant | varchar(16) | 1 | YES | 租户 |

### FC_BudgetDetailPlan

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetPlanId | int(11) | &nbsp; | NO | 关联预算总计划Id |
| Amount | decimal(12,2) | &nbsp; | NO | 预算金额 |
| PlanBeginDate | timestamp | 0000-00-00 00:00:00 | NO | 预算计划执行的起始时间 |
| PlanEndDate | timestamp | 0000-00-00 00:00:00 | NO | 预算计划执行的终止时间 |
| ExpenseTypeId | int(11) | 0 | NO | 费用类别Id  0: 全部费用 |
| Category | tinyint(4) | &nbsp; | NO | 预算种类 1 定额 2 按人数计算 3.按交易额。。。 |
| Explain | text | &nbsp; | YES | 预算计划说明 |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人LoginId |
| UpdateLoginId | varchar(32) | &nbsp; | YES | 更新人LoginId |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |

### FC_BudgetType

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetName | varchar(256) | &nbsp; | YES | 预算项目名称 |
| BudgetNo | varchar(16) | &nbsp; | NO | 预算编号 |
| Type | tinyint(4) | 1 | NO | 预算类型：1 部门一般预算 2 专项预算 |
| ParentId | int(11) | &nbsp; | YES | 父项目Id |
| ManagementDimensionId | int(11) | &nbsp; | NO | 管理维度Id |
| Explain | text | &nbsp; | YES | 定义，用途及说明 |
| RecordStatus | tinyint(4) | 1 | NO | 状态 1 有效 2 无效 |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人Id |
| UpdateLoginId | varchar(32) | &nbsp; | YES | 更新人Id |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| Tenant | varchar(16) | 1 | NO | 租户 |

### FC_BudgetTbFeeInfo

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| DepartmentId | int(11) | &nbsp; | NO | 部门Id |
| DepartmentName | varchar(64) | &nbsp; | NO | 部门Name |
| SuperiorDepartmentId | int(11) | &nbsp; | YES | 父级部门Id |
| SuperiorDepartmentName | varchar(64) | &nbsp; | YES | 父级部门Name |
| BgDepartmentId | int(11) | &nbsp; | YES | bgId |
| BgDepartmentName | varchar(64) | &nbsp; | YES | bgName |
| Amount | decimal(12,2) | &nbsp; | NO | 金额 |
| EmployeeCount | int(11) | &nbsp; | NO | 人数 |
| Memo | text | &nbsp; | YES | 日志 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| Version | varchar(16) | &nbsp; | NO | 版本号 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |

### FC_BudgetPool

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetPlanNo | varchar(32) | &nbsp; | YES | &nbsp; |
| BudgetPlanId | int(11) | &nbsp; | NO | 预算计划Id |
| ExpenseTypeId | int(11) | &nbsp; | NO | 费用类别Id |
| Year | int(11) | &nbsp; | NO | 预算年份 |
| Month | int(11) | &nbsp; | NO | 预算月份 |
| TotalAmount | decimal(12,2) | &nbsp; | NO | 预算总金额 |
| AvailableAmount | decimal(12,2) | &nbsp; | NO | 可用余额 |
| UsedAmount | decimal(12,2) | &nbsp; | NO | 已执行金额 |
| FrozenAmount | decimal(12,2) | &nbsp; | NO | 冻结金额 |
| Explain | text | &nbsp; | YES | 说明 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| Version | varchar(16) | &nbsp; | NO | 版本号 |

### FS_SubAccountMapping-new

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetTypeId | int(11) | &nbsp; | NO | 预算项目Id |
| BudgetNo | varchar(16) | &nbsp; | YES | 预算编号 |
| BudgetName | varchar(256) | &nbsp; | YES | 预算项目名称 |
| ExpenseTypeId | int(11) | &nbsp; | NO | 费用类别Id |
| ExpenseCode | varchar(16) | &nbsp; | YES | 费用类型代码 |
| ExpenseName | varchar(256) | &nbsp; | YES | 费用类型名称 |
| SubAccountCode | varchar(50) | &nbsp; | YES | 科目段 |
| SubAccountName | varchar(500) | &nbsp; | YES | 科目名称 |
| memo | varchar(500) | &nbsp; | YES | 备注 |
| RecordStatus | tinyint(4) | &nbsp; | YES | 状态 1 有效，2 无效 |
| AddLoginId | varchar(32) | &nbsp; | YES | &nbsp; |
| UpdateLoginId | varchar(32) | &nbsp; | YES | &nbsp; |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | &nbsp; |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | &nbsp; |
| DepartmentId | int(11) | &nbsp; | YES | 部门id(7位) 无效 |
| DepartmentName | varchar(256) | &nbsp; | YES | 部门名称（workday) 无效 |

### FS_SubAccountMapping-tmp

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetTypeId | int(11) | &nbsp; | NO | 预算项目Id |
| BudgetNo | varchar(16) | &nbsp; | YES | 预算编号 |
| BudgetName | varchar(256) | &nbsp; | YES | 预算项目名称 |
| ExpenseTypeId | int(11) | &nbsp; | NO | 费用类别Id |
| ExpenseCode | varchar(16) | &nbsp; | YES | 费用类型代码 |
| ExpenseName | varchar(256) | &nbsp; | YES | 费用类型名称 |
| SubAccountCode | varchar(50) | &nbsp; | YES | 科目段 |
| SubAccountName | varchar(500) | &nbsp; | YES | 科目名称 |
| memo | varchar(500) | &nbsp; | YES | 备注 |
| RecordStatus | tinyint(4) | &nbsp; | YES | 状态 1 有效，2 无效 |
| AddLoginId | varchar(32) | &nbsp; | YES | &nbsp; |
| UpdateLoginId | varchar(32) | &nbsp; | YES | &nbsp; |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | &nbsp; |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | &nbsp; |
| DepartmentId | int(11) | &nbsp; | YES | 部门id(7位) 无效 |
| DepartmentName | varchar(256) | &nbsp; | YES | 部门名称（workday) 无效 |

### FC_BudgetRequestBaseInfo

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetRequestNo | varchar(16) | &nbsp; | NO | 预算申请单号 |
| ProposerNo | varchar(16) | &nbsp; | NO | 申请人工号 |
| ProposerName | varchar(32) | &nbsp; | NO | 申请人姓名 |
| ProposerDepartmentId | int(11) | 0 | NO | 申请人所在部门ID |
| ProposerDepartmentName | varchar(128) | &nbsp; | NO | 申请人所在部门名称 |
| ProposerCityName | varchar(32) | &nbsp; | NO | 申请人所在城市 |
| ProposerCityId | int(11) | 0 | NO | 申请人所在城市ID |
| BudgetAmount | decimal(12,2) | &nbsp; | NO | 金额 |
| BeginDate | timestamp | 0000-00-00 00:00:00 | NO | 项目开始时间 |
| EndDate | timestamp | 0000-00-00 00:00:00 | NO | 项目结束时间 |
| BudgetPurpose | text | &nbsp; | YES | 项目目的 |
| CostDepartmentId | int(11) | 0 | NO | 承担部门ID |
| CostDepartmentName | varchar(128) | &nbsp; | NO | 承担部门名称 |
| CostCityId | int(11) | 0 | NO | 承担城市ID |
| CostCityName | varchar(32) | &nbsp; | NO | 承担城市 |
| BudgetTypeId | int(11) | 0 | NO | 预算项目 |
| SupplierName | text | &nbsp; | YES | 供应商名称 |
| MaterielDetail | text | &nbsp; | YES | 物料明细 |
| Terms | text | &nbsp; | YES | 商务条款 |
| BudgetPlanNo | varchar(32) | &nbsp; | NO | 关联的预算编码 |
| AddLoginId | varchar(32) | -1 | NO | 添加人LoginId |
| UpdateLoginId | varchar(32) | -1 | NO | 更新人LoginId |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| RecordStatus | tinyint(1) | 1 | NO | 记录状态 1 有效 2 无效 |
| BudgetRequestStatus | tinyint(1) | 0 | NO | &nbsp; |
| BudgetAmountAppend | decimal(12,2) | 0.00 | YES | 追加金额提示 |
| ReferenceId | int(11) | 0 | YES | 关联原始预算申请id |
| Reason | text | &nbsp; | YES | 超额预算申请原因 |
| BudgetRequestType | tinyint(1) | 1 | NO | 记录状态 1 预算 2 超额 |
| BudgetProperty | tinyint(1) | 0 | NO | 记录预算性质1 预算外 2 预算内 |

### FC_BudgetType_new

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetName | varchar(256) | &nbsp; | YES | 预算项目名称 |
| BudgetNo | varchar(16) | &nbsp; | NO | 预算编号 |
| Type | tinyint(4) | 1 | NO | 预算类型：1 部门一般预算 2 专项预算 |
| ParentId | int(11) | &nbsp; | YES | 父项目Id |
| ManagementDimensionId | int(11) | &nbsp; | NO | 管理维度Id |
| Explain | text | &nbsp; | YES | 定义，用途及说明 |
| RecordStatus | tinyint(4) | 1 | NO | 状态 1 有效 2 无效 |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人Id |
| UpdateLoginId | varchar(32) | &nbsp; | YES | 更新人Id |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |

### beta-10.1.77.21

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| id | int(11) unsigned | &nbsp; | NO | &nbsp; |

### FC_BudgetPlan

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetPlanNo | varchar(32) | &nbsp; | YES | &nbsp; |
| BudgetBaseInfoId | int(11) | &nbsp; | NO | 关联预算基本信息Id |
| Amount | decimal(12,2) | &nbsp; | NO | 预算金额 |
| FinanceYear | varchar(16) | &nbsp; | NO | 年度 如：2015 |
| Version | varchar(16) | &nbsp; | NO | 版本 如2015-01 |
| Explain | text | &nbsp; | YES | 预算计划说明 |
| Status | tinyint(4) | &nbsp; | NO | 状态 1 草稿 2 审核中 3 已生效 4 作废 5 已关闭 6 终止 |
| StrategyId | int(11) | &nbsp; | NO | 控制策略Id |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人LoginId |
| UpdateLoginId | varchar(32) | &nbsp; | YES | 更新人LoginId |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |

### FC_BudgetExecutePlan

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BizType | tinyint(4) | 1 | NO | 来源业务类型 1 费用 2 物资申购 .3 采购订单.4 对公支付 5合同付款 6 项目合同 7彩虹营销 |
| OutBizId | varchar(32) | &nbsp; | NO | 来源业务号 |
| ExecutorId | varchar(32) | &nbsp; | NO | 执行人Id |
| ExpenseBeginDate | timestamp | 0000-00-00 00:00:00 | NO | 费用开始时间 |
| ExpenseEndDate | timestamp | 0000-00-00 00:00:00 | NO | 费用结束时间 |
| ExecuteDate | timestamp | 0000-00-00 00:00:00 | NO | 执行时间 |
| Amount | decimal(12,2) | &nbsp; | NO | 金额 |
| BudgetPlanId | int(11) | &nbsp; | NO | 预算总计划Id |
| BudgetPlanNo | varchar(32) | &nbsp; | NO | 预算总计划编号 |
| BudgetPlanVersion | varchar(32) | &nbsp; | NO | 预算总计划版本 |
| ExpenseTypeId | int(11) | &nbsp; | NO | 费用类别Id |
| Status | tinyint(4) | &nbsp; | NO | 状态 1 初始 2 占用 3 执行 4 释放 |
| ExceedBudget | tinyint(1) | 0 | NO | 是否超预算 true 是 false 否 |
| StrategyId | int(11) | &nbsp; | NO | 执行策略Id |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人Id |
| UpdateLoginId | varchar(32) | &nbsp; | YES | 修改人Id |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| ExceedBudgetAmount | decimal(12,2) | 0.00 | NO | 超出预算金额 |
| ExecuteAmount | decimal(12,2) | 0.00 | NO | 执行金额 |
| UsageEntries | varchar(128) | &nbsp; | NO | 关联UsageEntry |
| ReleaseAmount | decimal(12,2) | 0.00 | NO | 冻结金额 |

### FC_ExpenseType

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| ParentId | int(11) | &nbsp; | NO | 父类型Id |
| ExpenseCode | varchar(16) | &nbsp; | NO | 费用类型代码 |
| ExpenseName | varchar(255) | &nbsp; | NO | 费用类型名称 |
| Description | text | &nbsp; | YES | 费用类型说明 |
| RecordStatus | tinyint(4) | 0 | NO | 状态：1 有效 2 无效 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人Id |
| UpdateLoginId | varchar(32) | &nbsp; | YES | 更新人Id |
| Tenant | varchar(16) | 1 | NO | 租户 |

### FC_BudgetTypeConfig

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | &nbsp; |
| BudgetTypeId | int(11) | &nbsp; | NO | &nbsp; |
| BudgetConfigType | tinyint(4) | 0 | NO | 类型 1:费用预算 ,2:采购预算 |
| RecordStatus | tinyint(4) | 1 | NO | 状态 1有效 2无效 |
| AddLoginId | varchar(32) | &nbsp; | NO | &nbsp; |
| UpdateLoginId | varchar(32) | &nbsp; | YES | &nbsp; |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | &nbsp; |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | &nbsp; |
| Tenant | varchar(16) | 1 | NO | 租户 |

### FC_HisBudgetPool

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetPlanNo | varchar(32) | &nbsp; | YES | &nbsp; |
| BudgetPlanId | int(11) | &nbsp; | NO | 预算计划Id |
| ExpenseTypeId | int(11) | &nbsp; | NO | 费用类别Id |
| Year | int(11) | &nbsp; | NO | 预算年份 |
| Month | int(11) | &nbsp; | NO | 预算月份 |
| TotalAmount | decimal(10,2) | &nbsp; | NO | 预算总金额 |
| AvailableAmount | decimal(10,2) | &nbsp; | NO | 可用余额 |
| UsedAmount | decimal(10,2) | &nbsp; | NO | 已执行金额 |
| FrozenAmount | decimal(10,2) | &nbsp; | NO | 冻结金额 |
| Explain | text | &nbsp; | YES | 说明 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| Version | varchar(16) | &nbsp; | NO | 版本号 |

### FC_BudgetTypeScopeInfo

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| BudgetTypeId | int(11) | &nbsp; | NO | 预算项目ID |
| DepartmentId | int(11) | &nbsp; | NO | 可见部门ID |
| RecordStatus | tinyint(1) | 1 | NO | 状态 1 有效 2 无效 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddloginId | varchar(32) | -1 | NO | 添加人 |
| UpdateLoginId | varchar(32) | -1 | NO | 更新人 |

### FC_BudgetTbFeeShareInfo

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| DepartmentId | int(11) | &nbsp; | NO | 部门Id |
| DepartmentName | varchar(128) | &nbsp; | NO | 部门Name |
| BuDepartmentId | int(11) | &nbsp; | YES | 父级部门Id |
| BuDepartmentName | varchar(128) | &nbsp; | YES | 父级部门Name |
| BgDepartmentId | int(11) | &nbsp; | YES | bgId |
| BgDepartmentName | varchar(128) | &nbsp; | YES | bgName |
| Amount | decimal(12,2) | &nbsp; | NO | 金额 |
| Rate | decimal(12,4) | &nbsp; | NO | 共用比例 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 2000-01-01 00:00:00 | NO | 添加时间 |
| Version | varchar(16) | &nbsp; | NO | 版本号 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |

### FC_BudgetTransferEntry

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetTypeId | int(11) | &nbsp; | NO | 预算项目Id |
| Year | int(11) | &nbsp; | NO | 预算年度 |
| Month | int(11) | &nbsp; | NO | 预算月份 |
| OutDepartmentId | int(11) | &nbsp; | NO | 转出承担部门Id |
| OutBudgetPlanId | int(11) | &nbsp; | NO | 转出预算计划Id |
| InDepartmentId | int(11) | &nbsp; | NO | 转入承担部门Id |
| InBudgetPlanId | int(11) | &nbsp; | NO | 转入预算计划Id |
| Amount | decimal(10,2) | &nbsp; | NO | 金额 |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人LoginId |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |

### FC_BudgetAdministrator

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetTypeId | int(11) | 0 | NO | 预算ID 0所有预算 |
| AdminNo | varchar(16) | &nbsp; | NO | 工号 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| Tenant | varchar(32) | 0 | YES | 所属租户 1 集团 2 猫眼 |

### FC_ManagementDimension

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| DimensionNo | varchar(16) | &nbsp; | NO | 管理维度编号 |
| Name | varchar(255) | 1 | NO | 管理维度名称 |
| Explain | text | &nbsp; | YES | 描述 |
| RecordStatus | tinyint(1) | 1 | NO | 状态 1 有效 2 无效 |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人Id |
| UpdateLoginId | varchar(32) | &nbsp; | YES | 更新人Id |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |

### FC_HisBudgetPlan

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetPlanNo | varchar(32) | &nbsp; | YES | &nbsp; |
| BudgetTypeConfigId | int(11) | &nbsp; | NO | 关联预算配置Id |
| Amount | decimal(12,2) | &nbsp; | NO | 预算金额 |
| FinanceYear | varchar(16) | &nbsp; | NO | 年度 如：2015 |
| Version | varchar(16) | &nbsp; | NO | 版本 如2015-01 |
| Explain | text | &nbsp; | YES | 预算计划说明 |
| Status | tinyint(4) | &nbsp; | NO | 状态 1 草稿 2 审核中 3 已生效 4 作废 5 已关闭 6 终止 |
| StrategyId | int(11) | &nbsp; | NO | 控制策略Id |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人LoginId |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |

### FC_WorkflowLog

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| BizType | tinyint(4) | &nbsp; | NO | 业务类型 1 预算 |
| OutBizId | varchar(32) | &nbsp; | NO | 外部业务号 |
| WorkflowNo | varchar(32) | &nbsp; | NO | 流程号 |
| WorkflowStatus | tinyint(4) | 0 | NO | 流程状态 1 初始 2 结束 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |

### FC_BudgetPretrialAuditorConfig

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetTypeId | int(11) | 0 | NO | 预算项目ID |
| DepartmentId | int(11) | 0 | NO | 承担部门ID |
| PretrialDepartmentId | int(11) | 0 | NO | 申请人所在部门ID |
| CityId | int(11) | 0 | NO | 申请人城市ID |
| MinAmount | decimal(10,2) | 0.00 | NO | >=金额 |
| MaxAmount | decimal(10,2) | 99999999.00 | NO | <金额 |
| ExpenseCatalog | tinyint(4) | 0 | NO | 费用单据类别 |
| PretrialAuditor | varchar(16) | 0 | NO | 预审人工号 |
| CanViewBudget | tinyint(4) | 0 | NO | 是否可以查看预算 0: 不能, 1: 可以 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddLoginId | varchar(32) | 0 | NO | 添加操作人 |
| UpdateLoginId | varchar(32) | 0 | NO | 更新操作人 |

### FC_HisBudgetDetailPlan

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| HisBudgetPlanId | int(11) | &nbsp; | NO | 关联历史预算总计划Id |
| Amount | decimal(12,2) | &nbsp; | NO | 预算金额 |
| PlanBeginDate | timestamp | 0000-00-00 00:00:00 | NO | 预算计划执行的起始时间 |
| PlanEndDate | timestamp | 0000-00-00 00:00:00 | NO | 预算计划执行的终止时间 |
| ExpenseTypeId | int(11) | 0 | NO | 费用类别Id  0: 全部费用 |
| Explain | text | &nbsp; | YES | 预算计划说明 |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人LoginId |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |

### FC_BudgetControlStrategy

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| PeriodType | tinyint(4) | 1 | NO | 控制周期 1 年 2 半年 3 季度 4 月 |
| Duration | int(11) | 1 | NO | 控制期间 |
| LimitType | int(11) | 1 | NO | 控制额度类型： 1 单项控制 2 费用明细控制 3 总额控制 |
| AlgorithmType | int(11) | 1 | NO | 算法类型： 1 绝对额控制 2 百分比控制 |
| AlgorithmPercent | decimal(12,2) | 100.00 | NO | 百分比额 |
| ControlProperty | tinyint(4) | 1 | NO | 控制性质 1 柔性 2 刚性 |
| RecordStatus | tinyint(4) | 1 | NO | 状态 1 有效 2 无效 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人Id |
| UpdateLoginId | varchar(32) | &nbsp; | YES | 更新人Id |
| OccupyType | tinyint(4) | 1 | NO | 预算占用策略1 按单据最新提交日期占用预算 2 按单据最开始提交日期占用预算 3 按费用发生日期占用预算 |

### FS_SubAccountMapping-bak

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetTypeId | int(11) | &nbsp; | NO | 预算项目Id |
| BudgetNo | varchar(16) | &nbsp; | YES | 预算编号 |
| BudgetName | varchar(256) | &nbsp; | YES | 预算项目名称 |
| ExpenseTypeId | int(11) | &nbsp; | NO | 费用类别Id |
| ExpenseCode | varchar(16) | &nbsp; | YES | 费用类型代码 |
| ExpenseName | varchar(256) | &nbsp; | YES | 费用类型名称 |
| SubAccountCode | varchar(50) | &nbsp; | YES | 科目段 |
| SubAccountName | varchar(500) | &nbsp; | YES | 科目名称 |
| memo | varchar(500) | &nbsp; | YES | 备注 |
| RecordStatus | tinyint(4) | &nbsp; | YES | 状态 1 有效，2 无效 |
| AddLoginId | varchar(32) | &nbsp; | YES | &nbsp; |
| UpdateLoginId | varchar(32) | &nbsp; | YES | &nbsp; |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | &nbsp; |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | &nbsp; |
| DepartmentId | int(11) | &nbsp; | YES | 部门id(7位) 无效 |
| DepartmentName | varchar(256) | &nbsp; | YES | 部门名称（workday) 无效 |

### FS_AccountMapping

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetTypeId | int(11) | &nbsp; | YES | 预算项目Id |
| BudgetName | varchar(256) | &nbsp; | YES | 预算项目名称 |
| BudgetNo | varchar(16) | &nbsp; | YES | 预算编号 |
| Type | tinyint(4) | &nbsp; | YES | 预算性质 1专项预算 2申请人所在部门 3 承担部门 |
| AccountCode | varchar(50) | &nbsp; | YES | oracle代码 |
| AccountName | varchar(256) | &nbsp; | YES | oracle名称 |
| memo | varchar(500) | &nbsp; | YES | 备注 |
| RecordStatus | tinyint(4) | &nbsp; | YES | 状态 1 有效，2 无效 |
| AddLoginId | varchar(32) | &nbsp; | YES | &nbsp; |
| UpdateLoginId | varchar(32) | &nbsp; | YES | &nbsp; |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | &nbsp; |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | &nbsp; |
| Tenant | varchar(32) | &nbsp; | YES | &nbsp; |

### FS_SubAccountMapping

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| BudgetTypeId | int(11) | &nbsp; | NO | 预算项目Id |
| BudgetNo | varchar(16) | &nbsp; | YES | 预算编号 |
| BudgetName | varchar(256) | &nbsp; | YES | 预算项目名称 |
| ExpenseTypeId | int(11) | &nbsp; | NO | 费用类别Id |
| ExpenseCode | varchar(16) | &nbsp; | YES | 费用类型代码 |
| ExpenseName | varchar(256) | &nbsp; | YES | 费用类型名称 |
| SubAccountCode | varchar(50) | &nbsp; | YES | 子目段 |
| SubAccountName | varchar(500) | &nbsp; | YES | 子目 |
| memo | varchar(500) | &nbsp; | YES | 备注 |
| RecordStatus | tinyint(4) | &nbsp; | YES | 状态 1 有效，2 无效 |
| AddLoginId | varchar(32) | &nbsp; | YES | &nbsp; |
| UpdateLoginId | varchar(32) | &nbsp; | YES | &nbsp; |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | &nbsp; |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | &nbsp; |
| DepartmentId | int(11) | &nbsp; | YES | 部门id(7位) |
| DepartmentName | varchar(256) | &nbsp; | YES | 部门名称（workday) |
| Tenant | varchar(32) | &nbsp; | YES | &nbsp; |

### FC_SerialNoGen

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| Prefix | varchar(4) | &nbsp; | NO | 前缀 |
| SerialYear | char(4) | &nbsp; | NO | 年份 |
| SerialMonth | char(2) | &nbsp; | NO | 月份 |
| MaxNo | int(11) | &nbsp; | NO | 一个月一个计数器 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | &nbsp; |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | &nbsp; |

### FC_BudgetExpenseRelation

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| ExpenseTypeId | int(11) | &nbsp; | NO | 费用类型Id |
| BudgetTypeId | int(11) | &nbsp; | NO | 预算类型Id |
| RecordStatus | tinyint(4) | 1 | NO | 状态：1 有效 2 无效 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人Id |
| UpdateLoginId | varchar(32) | &nbsp; | NO | 更新人Id |

### FC_BudgetUsageEntry

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| ResouceType | tinyint(4) | 1 | NO | 来源方： 1 预算计划 2 预算执行计划 |
| ResourceId | varchar(64) | &nbsp; | NO | 关联来源方Id |
| ExecutorId | varchar(32) | &nbsp; | NO | 执行人Id |
| Amount | decimal(12,2) | &nbsp; | NO | 金额 |
| UsageType | tinyint(4) | &nbsp; | NO | 操作类型1 占用 2 释放 3 执行 4 回填 5 追加预算 6 减少预算 |
| BudgetPoolId | int(11) | &nbsp; | NO | 预算池Id |
| AddLoginId | varchar(32) | &nbsp; | NO | 添加人LoginId |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |

