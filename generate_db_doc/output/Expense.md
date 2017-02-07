### FS_WorkflowLog

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| BizType | tinyint(4) | &nbsp; | NO | 业务类型 1 报销 |
| OutBizId | varchar(32) | &nbsp; | NO | 外部业务号 |
| WorkflowNo | varchar(32) | &nbsp; | NO | 流程号 |
| WorkflowStatus | tinyint(4) | 0 | NO | 流程状态 1 初始 2 结束 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |

### FS_ExpenseCostInfoDraft

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| CostAmount | decimal(10,2) | 0.00 | NO | 承担金额 |
| CostCityId | int(11) | &nbsp; | YES | 承担城市Id |
| CostCity | varchar(32) | &nbsp; | YES | 承担城市名称 |
| CostCompanyId | int(11) | &nbsp; | YES | 承担公司Id |
| CostCompany | varchar(32) | &nbsp; | YES | 承担公司名称 |
| CostDepartmentId | int(11) | 0 | NO | 承担部门ID |
| CostDepartment | varchar(128) | &nbsp; | YES | 承担部门名称 |
| ExpenseBaseId | int(11) | &nbsp; | NO | 费用基本信息Id |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| CostRate | decimal(3,2) | 1.00 | NO | 分摊比例 |

### FS_EBSBatchNum

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| BatchYear | char(4) | &nbsp; | NO | 年份 |
| BatchMonth | char(2) | &nbsp; | NO | 月份 |
| BatchDay | char(2) | &nbsp; | NO | 月份 |
| UserNo | varchar(32) | &nbsp; | YES | &nbsp; |
| CompanyCode | varchar(32) | &nbsp; | NO | 公司段 |
| BatchNum | varchar(32) | &nbsp; | NO | 批次号 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| RecordStatus | tinyint(4) | 1 | NO | 状态 |

### FW_AuditDuration

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| Month | varchar(10) | 0 | NO | 年月 |
| AuditName | varchar(20) | &nbsp; | NO | 节点名称 |
| Duration | decimal(10,2) | 0.00 | NO | 时长 |
| ProcessDef | varchar(10) | 0 | NO | 流程定义 |
| Status | tinyint(1) | 1 | NO | 状态 1 有效 2 无效 |
| ExpenseCatalog | tinyint(4) | 0 | NO | 单据类别 0 2,3,6 2 差旅 3 一般报销 6 业务招待 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | 更新时间 |

### FS_RoleConfig

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| CityID | int(11) | &nbsp; | NO | 城市ID |
| RoleID | int(11) | &nbsp; | NO | 角色ID |
| WorkNo | varchar(16) | &nbsp; | NO | 角色人工号 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| Status | tinyint(4) | 1 | NO | 状态 1 有效 2 无效 |

### FS_AuditNodeConfig

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| ExpenseCatalog | tinyint(4) | &nbsp; | NO | 单据类型 |
| AuditNode | varchar(64) | &nbsp; | NO | 审批节点 |
| ActionType | tinyint(4) | 0 | NO | 操作 1 强制跳过 2 强制执行 |
| BudgetTypeId | int(11) | 0 | NO | 预算类别Id |
| CostDepartmentId | int(11) | 0 | NO | 承担部门Id |
| Status | tinyint(1) | 1 | NO | 状态 1 有效 2 无效 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddLoginId | int(11) | -1 | NO | 添加人LoginId |
| UpdateLoginId | int(11) | -1 | NO | 更新人LoginId |

### FS_NormalExpenseExtendInfoDraft

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| VarName | varchar(32) | &nbsp; | NO | 参数名 |
| VarValue | varchar(255) | &nbsp; | YES | 参数值 |
| Status | tinyint(4) | &nbsp; | NO | 状态 1 有效 2 无效 |
| ExpenseItemId | int(11) | &nbsp; | NO | 关联费用明细Id |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |

### FW_SubmitCount

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| Month | varchar(10) | 0 | NO | 年月 |
| Count | int(11) | 0 | NO | 数量 |
| Status | tinyint(1) | 1 | NO | 状态 1 有效 2 无效 |
| ExpenseCatalog | tinyint(4) | 0 | NO | 单据类别 0 2,3,6 2 差旅 3 一般报销 6 业务招待 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | 更新时间 |

### FS_Payment

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| PaymentNo | varchar(32) | &nbsp; | NO | 付款号 |
| BizType | tinyint(4) | 0 | NO | 外部业务类型 1 费用报销 |
| OutBizId | varchar(32) | &nbsp; | NO | 外部业务号 |
| PayAmount | decimal(10,2) | 0.00 | NO | 付款金额 |
| PayeeId | varchar(20) | &nbsp; | NO | 收款对象Id |
| BankAccountId | varchar(20) | &nbsp; | NO | 银行账号Id |
| PayeeType | tinyint(4) | 0 | NO | 付款对象类型 1 员工 2 供应商 |
| PaymentStatus | tinyint(4) | 0 | NO | 付款状态 1 待确认 2 已付款 3 付款失败 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | 更新时间 |
| Memo | varchar(200) | &nbsp; | YES | 备注 |
| Memo2 | text | &nbsp; | YES | 备注2 |
| BatchNum | varchar(32) | &nbsp; | NO | 批次号 |
| FirstApprovalNo | varchar(32) | &nbsp; | NO | 财务初审员工号 |
| status | tinyint(4) | 1 | NO | 1正常、2作废 |
| ExpenseNo | varchar(32) | &nbsp; | YES | 费用单据号 |

### FS_ExpenseItem

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| ExpenseTypeId | int(11) | &nbsp; | NO | 费用类别Id |
| ExpenseAmount | decimal(10,2) | &nbsp; | NO | 费用金额 |
| ExpenseBeginDate | timestamp | 0000-00-00 00:00:00 | NO | 费用发生起始时间 |
| ExpenseEndDate | timestamp | 0000-00-00 00:00:00 | NO | 费用发生终止时间 |
| ExpenseDescription | text | &nbsp; | YES | 费用说明 |
| ExpenseBaseId | int(11) | &nbsp; | NO | 费用基本信息Id |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| BudgetTypeId | int(11) | 0 | YES | 预算类型ID |
| ExpenseSortNo | int(11) | &nbsp; | YES | 费用产生顺序号 |

### FS_AuditAmountLimit

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| BudgetTypeId | int(11) | 0 | NO | 预算项目ID |
| DepartmentId | int(11) | 0 | NO | 承担部门ID |
| CityId | int(11) | 0 | NO | 城市ID |
| MinAmount | decimal(10,2) | 0.00 | NO | 最小金额 |
| MaxAmount | decimal(10,2) | 99999999.99 | NO | 最大金额 |
| AuditNode | varchar(32) | &nbsp; | NO | 审批节点 |
| ExpenseCatalog | tinyint(4) | 0 | NO | 单据类型 |
| Status | tinyint(1) | 1 | NO | 状态 1 有效 2 无效 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddLoginId | int(11) | -1 | NO | 添加操作人 |
| UpdateLoginId | int(11) | -1 | NO | 更新操作人 |

### FS_ExpenseInvoice

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| ExpenseNo | varchar(32) | &nbsp; | NO | 费用单据号 |
| ExpenseCatalog | tinyint(4) | 0 | NO | 费用单据类别 1 加班费报销 2 差旅费报销 3 一般普通报销 4 支付申请 5 备用金申请 |
| ProposerNo | varchar(20) | &nbsp; | YES | 申请人工号 |
| ProposerName | varchar(32) | &nbsp; | YES | 申请人姓名 |
| ExpressNo | varchar(64) | &nbsp; | YES | 快递单号 |
| ExpressCompany | varchar(64) | &nbsp; | YES | 快递公司 |
| ExpenseTotalAmount | decimal(10,2) | &nbsp; | NO | 费用单据总金额 |
| InvoiceCount | int(11) | 0 | NO | 发票张数 |
| AddLoginId | int(11) | &nbsp; | NO | 添加操作人 |
| UpdateLoginId | int(11) | &nbsp; | NO | 更新操作人 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| Status | tinyint(4) | 0 | NO | 状态 1 待收票 2 待寄送 3 寄送中 4 已签收 |
| ReceivedUser | int(11) | 0 | YES | &nbsp; |

### FS_EBSInvoiceLine

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | &nbsp; |
| HeaderId | int(11) | 0 | NO | HeaderId |
| InterfaceType | varchar(32) | &nbsp; | NO | 接口类型, 取常量员工报销 |
| InvoiceNum | varchar(32) | &nbsp; | NO | 报销单号，与头保持一致 |
| LineId | varchar(32) | &nbsp; | NO | 行号，需要全表保持唯一 |
| LineTypeLookupCode | varchar(32) | &nbsp; | NO | 行类型 |
| CompanyCode | varchar(32) | &nbsp; | NO | 公司编码 |
| DeptCode | varchar(32) | &nbsp; | NO | 部门编码，部门编码为费用归属部门的编码，以PS传入的组织代码为准，去掉30 |
| AccountCode | varchar(32) | &nbsp; | NO | 科目编码 |
| ProjectCode | varchar(32) | &nbsp; | NO | 项目编码 |
| AccountAmount | decimal(10,2) | 0.00 | NO | 金额 |
| Description | text | &nbsp; | NO | 行摘要 |
| AmortizationStartDate | timestamp | 2000-01-01 00:00:00 | NO | 摊销起始日期，员工报销留空 |
| LifeMonths | varchar(32) | &nbsp; | NO | 摊销月数，员工报销留空 |
| RealInvoiceNum | varchar(64) | &nbsp; | NO | 真实发票编号 |
| ProcessFlag | varchar(32) | &nbsp; | NO | 处理标识，传 N |
| ProcessMessage | text | &nbsp; | NO | 处理错误消息 |
| CreationDate | timestamp | 2000-01-01 00:00:00 | NO | &nbsp; |
| LastUpdateDate | timestamp | 2000-01-01 00:00:00 | NO | &nbsp; |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 修改时间 |
| AddTime | timestamp | 2000-01-01 00:00:00 | NO | 添加日期 |
| RecordStatus | tinyint(1) | 1 | NO | 记录状态 1 有效 2 无效 |

### FS_UserBehavior

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| id | int(11) | &nbsp; | NO | key |
| WorkNo | varchar(10) | &nbsp; | NO | 员工号 |
| Page | int(11) | &nbsp; | NO | 页面代号1.差旅报销页面 |
| Behavior | int(11) | &nbsp; | NO | 行为代号1.不再浏览提示 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |

### FS_PayCompany

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| TianjiId | int(11) | 0 | NO | 天玑Id |
| PigCode | varchar(255) | &nbsp; | NO | PigCode |
| Code | varchar(255) | &nbsp; | NO | Code |
| Name | varchar(255) | &nbsp; | NO | 公司名称 |
| EbsCode | varchar(255) | &nbsp; | NO | EBSCode |
| Status | tinyint(4) | 1 | NO | 状态：1 新 2 旧 |
| AddTime | timestamp | 2000-01-01 00:00:00 | NO | 创建时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| RecordStatus | tinyint(4) | 1 | NO | 记录状态: 1 有效 2 无效 |

### FW_PurchaseDuration

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| Month | varchar(10) | 0 | NO | 年月 |
| Duration | decimal(10,2) | 0.00 | NO | 时长 |
| ProcessDef | varchar(10) | 0 | NO | 流程定义 |
| Status | tinyint(1) | 1 | NO | 状态 1 有效 2 无效 |
| ExpenseCatalog | tinyint(4) | 0 | NO | 单据类别 0 2,3,6 2 差旅 3 一般报销 6 业务招待 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | 更新时间 |

### FS_NormalExpenseExtendInfo

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| VarName | varchar(32) | &nbsp; | NO | 参数名 |
| VarValue | varchar(255) | &nbsp; | YES | 参数值 |
| Status | tinyint(4) | &nbsp; | NO | 状态 1 有效 2 无效 |
| ExpenseItemId | int(11) | &nbsp; | NO | 关联费用明细Id |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |

### FS_ExpenseRelation

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | key |
| ExpenseNo | varchar(30) | &nbsp; | NO | 差旅报销单号 |
| RelateNo | varchar(30) | &nbsp; | NO | 招待报销单号 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |
| Status | tinyint(4) | 1 | NO | 状态1正常2作废 |

### FS_ExpenseNPS

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | KEY |
| WorkNo | varchar(20) | &nbsp; | NO | 工号 |
| Name | varchar(10) | &nbsp; | NO | 姓名 |
| Score | int(11) | &nbsp; | NO | 分数 |
| Suggestion | varchar(255) | &nbsp; | NO | 建议 |
| BatchID | varchar(255) | &nbsp; | NO | 评分批次 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |

### FW_RejectCount

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| Month | varchar(10) | 0 | NO | 年月 |
| Count | int(11) | 0 | NO | 数量 |
| Status | tinyint(1) | 1 | NO | 状态 1 有效 2 无效 |
| ExpenseCatalog | tinyint(4) | 0 | NO | 单据类别 0 2,3,6 2 差旅 3 一般报销 6 业务招待 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | 更新时间 |

### FS_AreaLevel

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| LevelName | varchar(32) | &nbsp; | NO | 级别名称 |
| LevelAmountLimit | decimal(10,2) | &nbsp; | NO | 级别金额上限 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| RecordStatus | tinyint(4) | 1 | NO | 状态 1 有效 2 无效 |

### FS_ExpenseBaseInfo

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| ExpenseNo | varchar(32) | &nbsp; | NO | 费用单据号 |
| ExpenseCatalog | tinyint(4) | 0 | NO | 费用单据类别 1 加班费报销 2 差旅费报销 3 一般普通报销 4 支付申请 5 备用金申请 |
| ProposerNo | varchar(20) | &nbsp; | YES | 申请人工号 |
| ProposerName | varchar(32) | &nbsp; | YES | 申请人姓名 |
| ProposerDepartmentId | int(11) | 0 | NO | 申请人所在部门ID(workDay-organizationId) |
| ProposerDepartment | varchar(128) | &nbsp; | YES | &nbsp; |
| ProposerCity | varchar(32) | &nbsp; | YES | 申请人所在城市 |
| ExpenseReason | text | &nbsp; | YES | 费用发生事由 |
| BizType | tinyint(4) | 0 | YES | 外部业务类型 1 费用管理 |
| OutBizId | varchar(32) | &nbsp; | YES | 外部业务号 |
| AddLoginId | int(11) | &nbsp; | NO | 添加操作人 |
| UpdateLoginId | int(11) | &nbsp; | NO | 更新操作人 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| ImprestVerificationId | int(11) | 0 | YES | 核销备用金申请单据Id |
| ExpenseTotalAmount | decimal(10,2) | &nbsp; | NO | 费用单据总金额 |
| HasAttachment | tinyint(1) | 0 | NO | 是否有附件 |
| ProposeDate | timestamp | 0000-00-00 00:00:00 | NO | 发起日期 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| PayerId | tinyint(4) | 0 | YES | 2:汉海上海;7:互诚 |

### FS_Role

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| RoleName | varchar(64) | &nbsp; | NO | 角色名称 |
| Description | varchar(255) | &nbsp; | YES | 角色描述 |
| Status | tinyint(4) | &nbsp; | NO | 状态 1 有效 2 无效 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |

### FS_ExpensePayeeInfoDraft

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| PayAmount | decimal(10,2) | 0.00 | NO | 支付费用金额 |
| PayeeId | varchar(20) | &nbsp; | NO |  支付对象ID |
| PayeeType | tinyint(4) | &nbsp; | YES | 支付对象类型 |
| ExpenseBaseId | int(11) | &nbsp; | NO | 费用基本信息Id |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| PayeeDepartmentId | int(11) | 0 | YES | 付款人部门id |
| PayeeDepartmentName | varchar(128) | &nbsp; | YES | 付款人部门名称 |
| IsDefaultPayee | tinyint(4) | 0 | YES | 是否默认付款人同申请人 默认0,不默认1 |
| PayeeFullName | varchar(128) | &nbsp; | YES | 付款人全称 |

### FS_CityList

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| CityID | smallint(6) | &nbsp; | NO | 主键 |
| CityName | varchar(20) | &nbsp; | NO | 城市名称 |
| CityCode | varchar(4) | &nbsp; | NO | 城市代码 |
| Abbreviation | varchar(20) | &nbsp; | YES | 城市名称拼音缩写 |

### FS_ExpenseItemDraft

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| ExpenseTypeId | int(11) | &nbsp; | NO | 费用类别Id |
| ExpenseAmount | decimal(10,2) | &nbsp; | NO | 费用金额 |
| ExpenseBeginDate | timestamp | 0000-00-00 00:00:00 | NO | 费用发生起始时间 |
| ExpenseEndDate | timestamp | 0000-00-00 00:00:00 | NO | 费用发生终止时间 |
| ExpenseDescription | text | &nbsp; | YES | 费用说明 |
| ExpenseBaseId | int(11) | &nbsp; | NO | 费用基本信息Id |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| BudgetTypeId | int(11) | 0 | YES | 预算类型ID |
| ExpenseSortNo | int(11) | &nbsp; | YES | 费用产生顺序号 |

### FS_EBSInvoiceHeader

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | &nbsp; |
| InterfaceType | varchar(64) | &nbsp; | NO | 接口类型, 取常量"员工报销" |
| BatchNum | varchar(32) | &nbsp; | NO | 会计审批批号 |
| ReimbursementType | varchar(64) | &nbsp; | NO | 报销单类型,取常量员工报销 |
| InvoiceNum | varchar(32) | &nbsp; | NO | 报销单号 |
| CompanyCode | varchar(32) | &nbsp; | NO | 公司编码 |
| VendorNumber | varchar(32) | &nbsp; | NO | 供应商编码，员工报销留空 |
| VendorSite | varchar(256) | &nbsp; | NO | 供应商地点，员工报销留空 |
| InvoiceDate | timestamp | 2000-01-01 00:00:00 | NO | 发票日期，使用提交申请日期 |
| GlDate | timestamp | 2000-01-01 00:00:00 | NO | 入账日期，通过审批的日期 |
| PaymentMethod | varchar(64) | &nbsp; | NO | 付款方法，传转账 |
| PaymentTerms | varchar(64) | &nbsp; | NO | 付款方式，传立即付款 |
| PayGroup | varchar(64) | &nbsp; | NO | 支付组，传“支付组” |
| DelayInvoice | varchar(32) | &nbsp; | NO | 后开票标记，员工报销留空 |
| FirstApproval | varchar(32) | &nbsp; | NO | 初审人，PS编号加姓名 01293_李四 |
| EmployeeNumber | varchar(64) | &nbsp; | NO | 员工编号 |
| ApprovalNum | varchar(64) | &nbsp; | NO | 审批流水号 |
| PayAccountNum | varchar(64) | &nbsp; | NO | 收款方银行账号 |
| PayAccountName | varchar(128) | &nbsp; | NO | 收款方银行账户名称 |
| BankName | varchar(128) | &nbsp; | NO | 开户行 |
| BankProvince | varchar(32) | &nbsp; | NO | 开户行省份 |
| BankCity | varchar(32) | &nbsp; | NO | 开户行城市 |
| BankBranchName | varchar(128) | &nbsp; | NO | 开户行支行名称 |
| BusinessAccount | varchar(32) | &nbsp; | NO | 收款方是否对公账户， Y 或 N |
| PaymentFlag | varchar(32) | &nbsp; | NO | 是否已付款标识，传 Y 或 N |
| Description | text | &nbsp; | NO | 摘要 |
| ProcessFlag | varchar(32) | &nbsp; | NO | 处理标志，传N |
| ProcessMessage | text | &nbsp; | NO | 处理消息 |
| CreationDate | timestamp | 2000-01-01 00:00:00 | NO | &nbsp; |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 修改时间 |
| AddTime | timestamp | 2000-01-01 00:00:00 | NO | 添加日期 |
| RecordStatus | tinyint(1) | 1 | NO | 记录状态 1 有效 2 无效 |
| CoaSource | varchar(128) | &nbsp; | YES | 用于区别不同财务会计结构的字段，目前分为“IPH”;“MAOYAN” |

### FW_BudgetAudit

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| Month | varchar(10) | 0 | NO | 年月 |
| Name | varchar(20) | 0 | NO | 姓名 |
| WorkNo | varchar(10) | 0 | NO | 工号 |
| Count | int(11) | 0 | NO | 数量 |
| Status | tinyint(1) | 1 | NO | 状态 1 有效 2 无效 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | 更新时间 |

### FS_ExpenseBaseInfoDraft

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| ExpenseNo | varchar(32) | &nbsp; | NO | 费用单据号 |
| ExpenseCatalog | tinyint(4) | 0 | NO | 费用单据类别 1 加班费报销 2 差旅费报销 3 一般普通报销 4 支付申请 5 备用金申请 |
| ProposerNo | varchar(20) | &nbsp; | YES | 申请人工号 |
| ProposerName | varchar(32) | &nbsp; | YES | 申请人姓名 |
| ProposerDepartmentId | int(11) | 0 | NO | 申请人所在部门ID(workDay-organizationId) |
| ProposerDepartment | varchar(128) | &nbsp; | YES | &nbsp; |
| ProposerCity | varchar(32) | &nbsp; | YES | 申请人所在城市 |
| ExpenseReason | text | &nbsp; | YES | 费用发生事由 |
| BizType | tinyint(4) | 0 | YES | 外部业务类型 1 费用管理 |
| OutBizId | varchar(32) | &nbsp; | YES | 外部业务号 |
| AddLoginId | int(11) | &nbsp; | NO | 添加操作人 |
| UpdateLoginId | int(11) | &nbsp; | NO | 更新操作人 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| ImprestVerificationId | int(11) | 0 | YES | 核销备用金申请单据Id |
| ExpenseTotalAmount | decimal(10,2) | &nbsp; | NO | 费用单据总金额 |
| HasAttachment | tinyint(1) | 0 | NO | 是否有附件 |
| ProposeDate | timestamp | 0000-00-00 00:00:00 | NO | 发起日期 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| PayerId | tinyint(4) | 0 | YES | 2:汉海上海;7:互诚 |

### FS_AuditConfig

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| AuditNode | varchar(128) | &nbsp; | NO | 审批节点key |
| DepartmentID | int(11) | &nbsp; | NO | 部门ID |
| Approval | int(11) | &nbsp; | NO | 审批人loginId |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | 更新时间 |
| BizType | tinyint(4) | 0 | NO | 业务类型 1 费用 |
| CityID | int(11) | 0 | NO | 城市ID |

### FW_ExceedBudgetCount

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| Month | varchar(10) | 0 | NO | 年月 |
| Count | int(11) | 0 | NO | 数量 |
| Status | tinyint(1) | 1 | NO | 状态 1 有效 2 无效 |
| ExpenseCatalog | tinyint(4) | 0 | NO | 单据类别 0 2,3,6 2 差旅 3 一般报销 6 业务招待 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | 更新时间 |

### FS_HistoryOvertime

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| ProcInstID | int(11) | &nbsp; | NO | processID |
| TotalAmount | decimal(10,2) | 0.00 | NO | 总金额 |
| ExpenseDate | varchar(10) | &nbsp; | YES | 发生日期 |
| ParticipantNum | varchar(10) | &nbsp; | YES | 工号 |
| ParticipantName | varchar(10) | &nbsp; | YES | 姓名 |
| FoodChargeTimes | int(11) | 0 | NO | 正常餐次数 |
| FoodChargeValue | decimal(10,2) | 0.00 | NO | 正常餐费 |
| TrafficChargeTimes | int(11) | 0 | NO | 正常交通次数 |
| TrafficChargeValue | decimal(10,2) | 0.00 | NO | 正常交通费 |
| WeekendFoodTimes | int(11) | 0 | NO | 周末餐次数 |
| WeekendFoodValue | decimal(10,2) | 0.00 | NO | 周末餐费 |
| WeekendTrafficTimes | int(11) | 0 | NO | 周末交通次数 |
| WeekendTrafficValue | decimal(10,2) | 0.00 | NO | 周末交通费 |

### FS_ExpenseExecuteInfo

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| Amount | decimal(10,2) | &nbsp; | YES | 费用金额  |
| CostCityId | int(11) | 0 | YES | 承担城市Id |
| CostCityName | varchar(32) | &nbsp; | YES | 承担城市名称 |
| CostDepartmentId | int(11) | &nbsp; | YES | 承担部门Id |
| CostDepartment | varchar(128) | &nbsp; | YES | 承担部门名称 |
| BudgetTypeId | int(11) | &nbsp; | YES | 预算类型Id |
| ExpenseTypeId | int(11) | &nbsp; | YES | 费用类型Id |
| ExpenseBeginDate | timestamp | &nbsp; | YES | 费用发生起始时间 |
| ExpenseEndDate | timestamp | &nbsp; | YES | 费用发生终止时间 |
| BudgetExecutePlanId | int(11) | &nbsp; | YES | 费用单据基本信息关联Id |
| ExpenseBaseId | int(11) | &nbsp; | YES | 费用单据基本信息关联Id |
| ExpenseItemId | int(11) | &nbsp; | YES | 费用单据明细关联Id |
| AddTime | timestamp | 0000-00-00 00:00:00 | YES | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | YES | 更新时间  |
| Status | tinyint(4) | 0 | YES | 状态： 1 有效 2 无效 |

### FS_SerialNoGen

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| Prefix | varchar(4) | &nbsp; | NO | 前缀 |
| SerialYear | char(4) | &nbsp; | NO | 年份 |
| SerialMonth | char(2) | &nbsp; | NO | 月份 |
| MaxNo | int(11) | &nbsp; | NO | 一个月一个计数器 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | &nbsp; |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | &nbsp; |

### FW_VPTaskCount

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| Month | varchar(10) | 0 | NO | 年月 |
| Count | int(11) | 0 | NO | 数量 |
| Status | tinyint(1) | 1 | NO | 状态 1 有效 2 无效 |
| ExpenseCatalog | tinyint(4) | 0 | NO | 单据类别 0 2,3,6 2 差旅 3 一般报销 6 业务招待 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | 更新时间 |

### FS_ExpenseMonitor

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| ExpenseNo | varchar(32) | &nbsp; | YES | 费用编号 |
| WorkflowNo | varchar(32) | &nbsp; | YES | 流程号 |
| Status | tinyint(4) | &nbsp; | NO | 状态 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| Result | varchar(255) | &nbsp; | NO | 监控结果 |
| PaymentNo | varchar(32) | &nbsp; | YES | 付款编号 |
| ResultCode | tinyint(4) | &nbsp; | NO | 监控结果代码 |

### FS_SLTRequest

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| SerialNum | varchar(32) | &nbsp; | NO | 商旅通标志 |
| EntId | int(11) | 0 | NO | 企业Id |
| EntStaffNum | varchar(32) | &nbsp; | NO | 申请人工号 |
| CategoryId | int(11) | 0 | NO | 预算项目Id |
| PayTime | timestamp | 0000-00-00 00:00:00 | NO | 消费时间 |
| CityId | int(11) | 0 | NO | 消费城市Id |
| PeopleNum | int(11) | 0 | NO | 招待人数 |
| Amount | decimal(12,2) | 0.00 | NO | 招待金额 |
| ShopName | varchar(64) | &nbsp; | NO | 招待店名 |
| Reason | text | &nbsp; | NO | 招待理由 |
| ExpenseNo | varchar(32) | &nbsp; | NO | 单据号 |
| DuplicateFlag | tinyint(4) | 0 | NO | 重复标志 |
| Result | tinyint(4) | 1 | NO | 处理结果 1 未处理 2 成功处理 |
| RecordStatus | tinyint(4) | &nbsp; | NO | 状态 1 有效 2 无效 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| Guests | text | &nbsp; | NO | 招待嘉宾 |
| InvoiceNum | int(11) | 0 | NO | 发票数量 |

### FS_ExpenseExecuteInfoDraft

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| Amount | decimal(10,2) | &nbsp; | YES | 费用金额  |
| CostCityId | int(11) | 0 | YES | 承担城市Id |
| CostCityName | varchar(32) | &nbsp; | YES | 承担城市名称 |
| CostDepartmentId | int(11) | &nbsp; | YES | 承担部门Id |
| CostDepartment | varchar(128) | &nbsp; | YES | 承担部门名称 |
| BudgetTypeId | int(11) | &nbsp; | YES | 预算类型Id |
| ExpenseTypeId | int(11) | &nbsp; | YES | 费用类型Id |
| ExpenseBeginDate | timestamp | &nbsp; | YES | 费用发生起始时间 |
| ExpenseEndDate | timestamp | &nbsp; | YES | 费用发生终止时间 |
| BudgetExecutePlanId | int(11) | &nbsp; | YES | 费用单据基本信息关联Id |
| ExpenseBaseId | int(11) | &nbsp; | YES | 费用单据基本信息关联Id |
| ExpenseItemId | int(11) | &nbsp; | YES | 费用单据明细关联Id |
| AddTime | timestamp | 0000-00-00 00:00:00 | YES | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | YES | 更新时间  |
| Status | tinyint(4) | 0 | YES | 状态： 1 有效 2 无效 |

### FS_Expense_WhiteList

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| WorkNo | varchar(20) | &nbsp; | NO | 工号 |
| StaffName | varchar(50) | &nbsp; | YES | 员工姓名 |
| TimesPerSeason | tinyint(4) | 0 | NO | 每季度报销次数 |
| ExpenseId | int(11) | &nbsp; | YES | 费用类型id |
| RecordStatus | tinyint(4) | 0 | NO | 状态1有效2无效 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AddLoginId | int(11) | &nbsp; | NO | 添加人Id |
| UpdateLoginId | int(11) | &nbsp; | YES | 更新人Id |

### FS_ReportRelation

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | key |
| ReportID | int(11) | &nbsp; | NO | 报表id |
| FieldID | int(11) | &nbsp; | NO | 字段id |
| Alias | varchar(255) | &nbsp; | YES | 别名 |
| Status | tinyint(4) | &nbsp; | NO | 状态 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |

### FS_ExpenseRelationDraft

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | key |
| ExpenseNo | varchar(30) | &nbsp; | NO | 差旅报销单号 |
| RelateNo | varchar(30) | &nbsp; | NO | 招待报销单号 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |
| Status | tinyint(4) | 1 | NO | 状态1正常2作废 |

### FS_PermissionConfig

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| DepartmentID | int(11) | 0 | NO | 部门ID |
| DepartmentFullName | varchar(128) | &nbsp; | NO | 部门名称 |
| LoginID | int(11) | &nbsp; | NO | 权限人ID |
| RecordStatus | tinyint(1) | 1 | NO | 状态 1 有效 2无效 |
| PermissionType | tinyint(4) | 1 | NO | 权限类型 1 流程查询 2 报表 |
| CityID | int(11) | 0 | NO | 城市ID |
| CityName | varchar(64) | &nbsp; | NO | 城市名称 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| BudgetTypeId | int(11) | 0 | YES | 预算项目Id |
| CostDepartmentId | int(11) | 0 | YES | 承担部门ID |

### FS_ExpensePayeeInfo

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| PayAmount | decimal(10,2) | 0.00 | NO | 支付费用金额 |
| PayeeId | varchar(20) | &nbsp; | NO |  支付对象ID |
| PayeeType | tinyint(4) | &nbsp; | YES | 支付对象类型 |
| ExpenseBaseId | int(11) | &nbsp; | NO | 费用基本信息Id |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| PayeeDepartmentId | int(11) | 0 | YES | 付款人部门id |
| PayeeDepartmentName | varchar(128) | &nbsp; | YES | 付款人部门名称 |
| IsDefaultPayee | tinyint(4) | 0 | YES | 是否默认付款人同申请人 默认0,不默认1 |
| PayeeFullName | varchar(128) | &nbsp; | YES | 付款人全称 |

### FS_WotExpenseExtendInfo

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| RegularWotTimes | tinyint(4) | 0 | YES | 工作日加班次数 |
| RegularTaxiTimes | tinyint(4) | 0 | YES | 工作日打车次数 |
| OtherWotTimes | tinyint(4) | 0 | YES | 非工作日加班次数 |
| OtherTaxiTimes | tinyint(4) | 0 | YES | 非工作日打车次数 |
| ExpenseItemId | int(11) | &nbsp; | NO | 费用明细Id |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| WotInvoiceAmount | decimal(10,2) | 0.00 | YES | 加班餐费发票 |
| TaxiInvoiceAmount | decimal(10,2) | 0.00 | YES | 打车发票 |
| RegularWotAmount | decimal(10,2) | 0.00 | YES | 工作日加班餐费 |
| RegularTaxiAmount | decimal(10,2) | 0.00 | YES | 工作日打车费用 |
| OtherWotAmount | decimal(10,2) | 0.00 | YES | 非工作日加班餐费 |
| OtherTaxiAmount | decimal(10,2) | 0.00 | YES | 非工作日打车费用 |
| SuggestRegularWotTimes | tinyint(4) | 0 | YES | 建议工作日加班报销次数 |
| SuggestRegularTaxiTimes | tinyint(4) | 0 | YES | 建议工作日打车报销次数 |
| SuggestOtherWotTimes | tinyint(4) | 0 | YES | 建议非工作日加班报销次数 |
| SuggestOtherTaxiTimes | tinyint(4) | 0 | YES | 建议非工作日打车报销次数 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |

### FS_Payment_History

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| PaymentNo | varchar(32) | &nbsp; | NO | 付款号 |
| BizType | tinyint(4) | 0 | NO | 外部业务类型 1 费用报销 |
| OutBizId | varchar(32) | &nbsp; | NO | 外部业务号 |
| PayAmount | decimal(10,2) | 0.00 | NO | 付款金额 |
| PayeeId | varchar(20) | &nbsp; | NO | 收款对象Id |
| BankAccountId | varchar(20) | &nbsp; | NO | 银行账号Id |
| PayeeType | tinyint(4) | 0 | NO | 付款对象类型 1 员工 2 供应商 |
| PaymentStatus | tinyint(4) | 0 | NO | 付款状态 1 待确认 2 已付款 3 付款失败 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |
| UpdateTime | timestamp | 0000-00-00 00:00:00 | NO | 更新时间 |
| Memo | varchar(200) | &nbsp; | YES | 备注 |
| Memo2 | text | &nbsp; | YES | 备注2 |
| status | tinyint(4) | 1 | NO | 1正常、2作废 |
| BatchNum | varchar(32) | &nbsp; | NO | 批次号 |
| FirstApprovalNo | varchar(32) | &nbsp; | NO | 财务初审员工号 |
| BatchNumCopy | varchar(32) | &nbsp; | NO | 批次号 |
| FirstApprovalNoCopy | varchar(32) | &nbsp; | NO | 财务初审员工号 |
| ExpenseNo | varchar(32) | &nbsp; | YES | 费用单据号 |

### FS_WotExpenseExtendInfoDraft

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| RegularWotTimes | tinyint(4) | 0 | YES | 工作日加班次数 |
| RegularTaxiTimes | tinyint(4) | 0 | YES | 工作日打车次数 |
| OtherWotTimes | tinyint(4) | 0 | YES | 非工作日加班次数 |
| OtherTaxiTimes | tinyint(4) | 0 | YES | 非工作日打车次数 |
| ExpenseItemId | int(11) | &nbsp; | NO | 费用明细Id |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| WotInvoiceAmount | decimal(10,2) | 0.00 | YES | 加班餐费发票 |
| TaxiInvoiceAmount | decimal(10,2) | 0.00 | YES | 打车发票 |
| RegularWotAmount | decimal(10,2) | 0.00 | YES | 工作日加班餐费 |
| RegularTaxiAmount | decimal(10,2) | 0.00 | YES | 工作日打车费用 |
| OtherWotAmount | decimal(10,2) | 0.00 | YES | 非工作日加班餐费 |
| OtherTaxiAmount | decimal(10,2) | 0.00 | YES | 非工作日打车费用 |
| SuggestRegularWotTimes | tinyint(4) | 0 | YES | 建议工作日加班报销次数 |
| SuggestRegularTaxiTimes | tinyint(4) | 0 | YES | 建议工作日打车报销次数 |
| SuggestOtherWotTimes | tinyint(4) | 0 | YES | 建议非工作日加班报销次数 |
| SuggestOtherTaxiTimes | tinyint(4) | 0 | YES | 建议非工作日打车报销次数 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |

### FS_ExpensePayment

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| ExpenseNo | varchar(32) | &nbsp; | NO | 费用单据号 |
| PayAmount | decimal(10,2) | &nbsp; | NO | 付款金额 |
| PaymentStatus | tinyint(4) | &nbsp; | NO | 付款状态 1支付中 2支付成功 3支付失败 4退票 5初始 |
| Status | tinyint(4) | 0 | NO | 状态1有效2无效 |
| AddTime | timestamp | 2000-01-01 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |

### FS_AuditAuthorizerConfig

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| AuditNode | varchar(128) | &nbsp; | NO | 审批节点key |
| DepartmentID | int(11) | 0 | NO | 部门ID |
| CityID | int(11) | 0 | NO | 城市ID |
| MinAmount | decimal(10,2) | 0.00 | NO | >=金额 |
| MaxAmount | decimal(10,2) | 99999999.00 | NO | <金额 |
| ExpenseCatalog | tinyint(4) | 0 | NO | 费用单据类别 |
| BudgetTypeID | int(11) | 0 | NO | 预算ID |
| AuthorizedBy | varchar(11) | 0 | NO | 授权人worknum |
| AuthorizedTo | varchar(11) | 0 | NO | 被授权人worknum |
| ExpiryDate | timestamp | 2038-01-19 00:00:00 | NO | 失效日期 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| ProposerDepartmentID | int(11) | 0 | NO | 申请人所在部门ID |

### FS_TMCExpenseNo

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| ExpenseNo | varchar(32) | &nbsp; | NO | 费用单据号 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |

### FS_AreaLevel_Config

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| Id | int(11) | &nbsp; | NO | 主键 |
| CityId | int(11) | &nbsp; | NO | 城市ID |
| CityName | varchar(16) | &nbsp; | NO | 城市名称 |
| AreaLevelId | int(11) | &nbsp; | NO | 地区等级ID |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| RecordStatus | tinyint(4) | 1 | NO | 状态 1 有效 2 无效 |

### FS_ExpenseCostInfo

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 主键 |
| CostAmount | decimal(10,2) | 0.00 | NO | 承担金额 |
| CostCityId | int(11) | &nbsp; | YES | 承担城市Id |
| CostCity | varchar(32) | &nbsp; | YES | 承担城市名称 |
| CostCompanyId | int(11) | &nbsp; | YES | 承担公司Id |
| CostCompany | varchar(32) | &nbsp; | YES | 承担公司名称 |
| CostDepartmentId | int(11) | 0 | NO | 承担部门ID |
| CostDepartment | varchar(128) | &nbsp; | YES | 承担部门名称 |
| ExpenseBaseId | int(11) | &nbsp; | NO | 费用基本信息Id |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| CostRate | decimal(3,2) | 1.00 | NO | 分摊比例 |

### FS_EBSWithholdData

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(12) | &nbsp; | NO | 主键 |
| InvoiceNum | varchar(32) | &nbsp; | NO | 报销单号 |
| DeptCode | varchar(32) | &nbsp; | NO | 部门ID |
| Type | tinyint(4) | 2 | NO | 对公/对私 |
| SupplierId | varchar(32) | &nbsp; | YES | 供应商ID |
| SiteId | varchar(32) | &nbsp; | YES | &nbsp; |
| EmployeeNum | varchar(50) | &nbsp; | NO | 工号 |
| Description | varchar(256) | &nbsp; | NO | 单据描述 |
| IsVat | varchar(1) | N | NO | 是否增值税发票 |
| TaxRate | decimal(3,2) | 0.00 | NO | 税率 |
| LineId | varchar(32) | &nbsp; | NO | &nbsp; |
| ComNum | varchar(32) | &nbsp; | NO | 主体公司ID |
| AccNum | varchar(32) | &nbsp; | NO | 科目段ID |
| ProjectNum | varchar(32) | &nbsp; | NO | 项目段ID |
| DisAmount | decimal(10,2) | 0.00 | NO | 承担金额 |
| DisDescription | varchar(256) | &nbsp; | NO | Dis描述 |
| Lmts | timestamp | 0000-00-00 00:00:00 | NO | 创建时间 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| Version | varchar(16) | &nbsp; | NO | 版本号 |
| Status | tinyint(4) | 0 | NO | 状态 1 有效 2 无效 |
| CoaSource | varchar(128) | &nbsp; | YES | 用于区别不同财务会计结构的字段，目前分为“IPH”;“MAOYAN” |

### FS_AuditCondition

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 自增主键 |
| DepartmentID | int(11) | &nbsp; | NO | 部门ID workday |
| OverAmount | decimal(11,2) | &nbsp; | NO | 超过多少金额 |
| Status | tinyint(4) | &nbsp; | NO | 是否有效1：有效；2：无效 |
| AddTime | timestamp | 0000-00-00 00:00:00 | NO | 添加时间 |
| UpdateTime | timestamp | CURRENT_TIMESTAMP | NO | 更新时间 |
| AuditNode | varchar(128) | &nbsp; | NO | 审批节点 |

### FS_ReportFields

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | key |
| FieldName | varchar(30) | &nbsp; | NO | 字段名称 |
| FieldVariable | varchar(30) | &nbsp; | YES | 字段对应变量 |
| ExpenseCatalog | int(11) | &nbsp; | NO | 费用类型 |
| Status | tinyint(4) | &nbsp; | NO | 状态 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |

### FS_ReportConfig

|字段名|字段类型|默认值|可否为空|备注|
|----|----|----|----|----|
| ID | int(11) | &nbsp; | NO | 报表id |
| ReportName | varchar(255) | &nbsp; | NO | 报表名 |
| ExpenseCatalog | tinyint(4) | &nbsp; | NO | 费用类别 |
| Owner | varchar(30) | &nbsp; | NO | 报表owner |
| Status | tinyint(4) | &nbsp; | NO | 状态1正常2作废 |
| AddTime | timestamp | CURRENT_TIMESTAMP | NO | 添加时间 |

