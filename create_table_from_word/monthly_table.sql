
DROP TABLE IF EXISTS `FC_PayableDetail_201510`;
CREATE TABLE `FC_PayableDetail_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号 ， BusinessSource + BusinessType + OutBizId 保证唯一',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称或编码',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `AccountingDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '应付日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `DailyId` int(11) NOT NULL DEFAULT 0 COMMENT '应付ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_DailyId(`DailyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始应付明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_PayableDetailExtendInfo_201510`;
CREATE TABLE `FC_PayableDetailExtendInfo_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `DetailId` int(11) NOT NULL DEFAULT 0 COMMENT '原始应付明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_DetailId(`DetailId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始应付明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_DailyPayable_201510`;
CREATE TABLE `FC_DailyPayable_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `AccountingDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '应付日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MonthlyId` int(11) NOT NULL DEFAULT 0 COMMENT '月度应付ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_MonthlyId(`MonthlyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '应付' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyPayable_201510`;
CREATE TABLE `FC_MonthlyPayable_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '应付月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度应付' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyPayableSummary_201510`;
CREATE TABLE `FC_MonthlyPayableSummary_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '应付月份yyyyMM',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度应付汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_ReceivableDetail_201510`;
CREATE TABLE `FC_ReceivableDetail_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `AccountingDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '应收日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `DailyId` int(11) NOT NULL DEFAULT 0 COMMENT '应收ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_DailyId(`DailyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始应收明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_ReceivableDetailExtendInfo_201510`;
CREATE TABLE `FC_ReceivableDetailExtendInfo_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `DetailId` int(11) NOT NULL DEFAULT 0 COMMENT '原始应收明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_DetailId(`DetailId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始应收明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_Receivable_201510`;
CREATE TABLE `FC_Receivable_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `AccountingDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '应收日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MonthlyId` int(11) NOT NULL DEFAULT 0 COMMENT '月度应收ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_MonthlyId(`MonthlyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '应收' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyReceivable_201510`;
CREATE TABLE `FC_MonthlyReceivable_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '应收月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `MonthlyId` int(11) NOT NULL DEFAULT 0 COMMENT '月度汇总ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_MonthlyId(`MonthlyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度应收' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyReceivableSummary_201510`;
CREATE TABLE `FC_MonthlyReceivableSummary_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '应收月份',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度应收汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_PaymentDetail_201510`;
CREATE TABLE `FC_PaymentDetail_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `PaymentTypeId` int(11) NOT NULL DEFAULT 0 COMMENT '付款类型',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `PayChannel` tinyint(4) NOT NULL DEFAULT 0 COMMENT '付款渠道 1 银行 2 支付宝 3 微信',
    `PayEntityId` int(11) NOT NULL DEFAULT 0 COMMENT '付款实体ID',
    `PaymentDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '付款日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `DailyId` int(11) NOT NULL DEFAULT 0 COMMENT '付款ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_DailyId(`DailyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始付款明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_PaymentDetailExtendInfo_201510`;
CREATE TABLE `FC_PaymentDetailExtendInfo_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `DetailId` int(11) NOT NULL DEFAULT 0 COMMENT '原始付款明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_DetailId(`DetailId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始付款明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_DailyPayment_201510`;
CREATE TABLE `FC_DailyPayment_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `PaymentTypeId` int(11) NOT NULL DEFAULT 0 COMMENT '付款类型',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `PayChannel` tinyint(4) NOT NULL DEFAULT 0 COMMENT '付款渠道 1 银行 2 支付宝 3 微信',
    `PayEntityId` int(11) NOT NULL DEFAULT 0 COMMENT '付款实体ID',
    `PaymentDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '付款日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MonthlyId` int(11) NOT NULL DEFAULT 0 COMMENT '月度付款ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_MonthlyId(`MonthlyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '付款' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyPayment_201510`;
CREATE TABLE `FC_MonthlyPayment_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `PaymentTypeId` int(11) NOT NULL DEFAULT 0 COMMENT '付款类型',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `PayChannel` tinyint(4) NOT NULL DEFAULT 0 COMMENT '付款渠道 1 银行 2 支付宝 3 微信',
    `PayEntityId` int(11) NOT NULL DEFAULT 0 COMMENT '付款实体ID',
    `PaymentMonth` int(11) NOT NULL DEFAULT 0 COMMENT '付款月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `MonthlyId` int(11) NOT NULL DEFAULT 0 COMMENT '月度汇总ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_MonthlyId(`MonthlyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度付款' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyPaymentSummary_201510`;
CREATE TABLE `FC_MonthlyPaymentSummary_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `PaymentTypeId` int(11) NOT NULL DEFAULT 0 COMMENT '付款类型',
    `PaymentMonth` int(11) NOT NULL DEFAULT 0 COMMENT '付款月份',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `PayChannel` tinyint(4) NOT NULL DEFAULT 0 COMMENT '付款渠道 1 银行 2 支付宝 3 微信',
    `PayEntityId` int(11) NOT NULL DEFAULT 0 COMMENT '付款实体ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度付款汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_CollectionDetail_201510`;
CREATE TABLE `FC_CollectionDetail_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CollectionTypeId` int(11) NOT NULL DEFAULT 0 COMMENT '收款类型',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `ReceiveChannel` tinyint(4) NOT NULL DEFAULT 0 COMMENT '收款渠道 1 银行 2 支付宝 3 微信',
    `ReceiveEntityId` int(11) NOT NULL DEFAULT 0 COMMENT '收款实体ID',
    `CollectionDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收款日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `DailyId` int(11) NOT NULL DEFAULT 0 COMMENT '收款ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_DailyId(`DailyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始收款明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_CollectionDetailExtendInfo_201510`;
CREATE TABLE `FC_CollectionDetailExtendInfo_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `DetailId` int(11) NOT NULL DEFAULT 0 COMMENT '原始收款明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_DetailId(`DetailId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始收款明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_DailyCollection_201510`;
CREATE TABLE `FC_DailyCollection_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CollectionTypeId` int(11) NOT NULL DEFAULT 0 COMMENT '收款类型',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `ReceiveChannel` tinyint(4) NOT NULL DEFAULT 0 COMMENT '收款渠道 1 银行 2 支付宝 3 微信',
    `ReceiveEntityId` int(11) NOT NULL DEFAULT 0 COMMENT '收款实体ID',
    `CollectionDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收款日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MonthlyId` int(11) NOT NULL DEFAULT 0 COMMENT '月度收款Id',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_MonthlyId(`MonthlyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '收款' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyCollection_201510`;
CREATE TABLE `FC_MonthlyCollection_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CollectionTypeId` int(11) NOT NULL DEFAULT 0 COMMENT '收款类型',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户Id',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `ReceiveChannel` tinyint(4) NOT NULL DEFAULT 0 COMMENT '收款渠道 1 银行 2 支付宝 3 微信',
    `ReceiveEntityId` int(11) NOT NULL DEFAULT 0 COMMENT '收款实体ID',
    `CollectionMonth` varchar(16) COMMENT '收款月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度收款' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyCollectionSummary_201510`;
CREATE TABLE `FC_MonthlyCollectionSummary_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CollectionTypeId` int(11) NOT NULL DEFAULT 0 COMMENT '收款类型',
    `CollectionMonth` varchar(16) COMMENT '收款月份',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `ReceiveChannel` tinyint(4) NOT NULL DEFAULT 0 COMMENT '收款渠道 1 银行 2 支付宝 3 微信',
    `ReceiveEntityId` int(11) NOT NULL DEFAULT 0 COMMENT '收款实体ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度收款汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_PrePaymentDetail_201510`;
CREATE TABLE `FC_PrePaymentDetail_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `AccountingDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预付日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `DailyId` int(11) NOT NULL DEFAULT 0 COMMENT '预付ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_DailyId(`DailyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始预付明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_PrePaymentDetailExtendInfo_201510`;
CREATE TABLE `FC_PrePaymentDetailExtendInfo_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `DetailId` int(11) NOT NULL DEFAULT 0 COMMENT '原始预付明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_DetailId(`DetailId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始预付明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_DailyPrePayment_201510`;
CREATE TABLE `FC_DailyPrePayment_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `AccountingDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预付日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MonthlyId` int(11) NOT NULL DEFAULT 0 COMMENT '月度预付ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_MonthlyId(`MonthlyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '预付' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyPrePayment_201510`;
CREATE TABLE `FC_MonthlyPrePayment_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '预付月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度预付' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyPrePaymentSummary_201510`;
CREATE TABLE `FC_MonthlyPrePaymentSummary_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '预付月份',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度预付汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_PreCollectionDetail_201510`;
CREATE TABLE `FC_PreCollectionDetail_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `AccountingDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预收日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `DailyId` int(11) NOT NULL DEFAULT 0 COMMENT '预收ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_DailyId(`DailyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始预收明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_PreCollectionDetailExtendInfo_201510`;
CREATE TABLE `FC_PreCollectionDetailExtendInfo_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `DetailId` int(11) NOT NULL DEFAULT 0 COMMENT '原始预收明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_DetailId(`DetailId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始预收明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_DailyPreCollection_201510`;
CREATE TABLE `FC_DailyPreCollection_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户Id',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `CollectionDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收款日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MonthlyId` int(11) NOT NULL DEFAULT 0 COMMENT '月度预收ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_MonthlyId(`MonthlyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '预收' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyPreCollection_201510`;
CREATE TABLE `FC_MonthlyPreCollection_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '预收月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度预收' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyPreCollectionSummary_201510`;
CREATE TABLE `FC_MonthlyPreCollectionSummary_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '预收月份',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度预收汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_BadDebtDetailExtendInfo_201510`;
CREATE TABLE `FC_BadDebtDetailExtendInfo_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `DetailId` int(11) NOT NULL DEFAULT 0 COMMENT '原始预收明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_DetailId(`DetailId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始坏账明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_BadDebtDetail_201510`;
CREATE TABLE `FC_BadDebtDetail_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `BadDebtDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '坏账确认日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `DailyId` int(11) NOT NULL DEFAULT 0 COMMENT '月度坏账ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_DailyId(`DailyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始坏账明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_DailyBadDebt_201510`;
CREATE TABLE `FC_DailyBadDebt_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `BadDebtDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '坏账确认日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MonthlyId` int(11) NOT NULL DEFAULT 0 COMMENT '月度坏账ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_MonthlyId(`MonthlyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始坏账明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyBadDebt_201510`;
CREATE TABLE `FC_MonthlyBadDebt_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '坏账确认月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度坏账' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyBadDebtSummary_201510`;
CREATE TABLE `FC_MonthlyBadDebtSummary_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '坏账确认月份',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度坏账汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_InvoiceDetailExtendInfo_201510`;
CREATE TABLE `FC_InvoiceDetailExtendInfo_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `DetailId` int(11) NOT NULL DEFAULT 0 COMMENT '原始预收明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_DetailId(`DetailId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始发票明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_InvoiceDetail_201510`;
CREATE TABLE `FC_InvoiceDetail_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `InvoiceType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '发票性质 1 技术服务费 2 广告费 3 广告发布费',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '开票公司Id',
    `InvoiceHeader` varchar(255) COMMENT '发票抬头',
    `Amount` decimal(10,2) COMMENT '发票金额',
    `InvoiceDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发票日期',
    `TaxNumber` varchar(32) COMMENT '税号',
    `DailyId` int(11) NOT NULL DEFAULT 0 COMMENT '开票ID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_DailyId(`DailyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始开票信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_DailyInvoice_201510`;
CREATE TABLE `FC_DailyInvoice_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `InvoiceType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '发票性质 1 技术服务费 2 广告费 3 广告发布费',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '开票公司Id',
    `Amount` decimal(10,2) COMMENT '发票金额',
    `InvoiceDate` datetime COMMENT '发票日期',
    `MonthlyId` int(11) NOT NULL DEFAULT 0 COMMENT '月度Id',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_MonthlyId(`MonthlyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '开票' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyInvoice_201510`;
CREATE TABLE `FC_MonthlyInvoice_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `InvoiceType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '发票性质 1 技术服务费 2 广告费 3 广告发布费',
    `CustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
    `CustomerName` varchar(255) COMMENT '客户名称',
    `SchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '方案ID',
    `SchemaName` varchar(255) COMMENT '方案名称',
    `ShopId` int(11) NOT NULL DEFAULT 0 COMMENT '分店ID',
    `ShopName` varchar(255) COMMENT '分店名称',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '开票公司Id',
    `Amount` decimal(10,2) COMMENT '发票金额',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '发票月份',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    UNIQUE KEY UX_OutBiz(`OutBizId`,`BusinessSource`,`BusinessType`),
    KEY IX_CustomerId(`CustomerId`),
    KEY IX_SchemaId(`SchemaId`),
    KEY IX_ShopId(`ShopId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度开票' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyInvoiceSummary_201510`;
CREATE TABLE `FC_MonthlyInvoiceSummary_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '月份',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度开票汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_VerificationDetailExtendInfo_201510`;
CREATE TABLE `FC_VerificationDetailExtendInfo_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `DetailId` int(11) NOT NULL DEFAULT 0 COMMENT '原始预收明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_DetailId(`DetailId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '原始明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_VerificationDetail_201510`;
CREATE TABLE `FC_VerificationDetail_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `OutBusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '转出业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `InBusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '转入业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `OutAccountingSubject` int(11) NOT NULL DEFAULT 0 COMMENT '转出账务科目',
    `InAccountingSubject` int(11) NOT NULL DEFAULT 0 COMMENT '转入账务科目',
    `OutCustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '转出客户ID',
    `OutCustomerName` varchar(255) COMMENT '转出客户名称',
    `OutSchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '转出方案ID',
    `OutSchemaName` varchar(255) COMMENT '转出方案名称',
    `OutShopId` int(11) NOT NULL DEFAULT 0 COMMENT '转出分店ID',
    `OutShopName` varchar(255) COMMENT '转出分店名称',
    `InCustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '转入客户ID',
    `InCustomerName` varchar(255) COMMENT '转入客户名称',
    `InSchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '转入方案ID',
    `InSchemaName` varchar(255) COMMENT '转入方案名称',
    `InShopId` int(11) NOT NULL DEFAULT 0 COMMENT '转入分店ID',
    `InShopName` varchar(255) COMMENT '转入分店名称',
    `VerificationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '核销日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `DailyId` int(11) NOT NULL DEFAULT 0 COMMENT '',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_DailyId(`DailyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '核销' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_DailyVerification_201510`;
CREATE TABLE `FC_DailyVerification_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `OutBusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '转出业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `InBusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '转入业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `OutAccountingSubject` int(11) NOT NULL DEFAULT 0 COMMENT '转出账务科目',
    `InAccountingSubject` int(11) NOT NULL DEFAULT 0 COMMENT '转入账务科目',
    `OutCustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '转出客户ID',
    `OutCustomerName` varchar(255) COMMENT '转出客户名称',
    `OutSchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '转出方案ID',
    `OutSchemaName` varchar(255) COMMENT '转出方案名称',
    `OutShopId` int(11) NOT NULL DEFAULT 0 COMMENT '转出分店ID',
    `OutShopName` varchar(255) COMMENT '转出分店名称',
    `InCustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '转入客户ID',
    `InCustomerName` varchar(255) COMMENT '转入客户名称',
    `InSchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '转入方案ID',
    `InSchemaName` varchar(255) COMMENT '转入方案名称',
    `InShopId` int(11) NOT NULL DEFAULT 0 COMMENT '转入分店ID',
    `InShopName` varchar(255) COMMENT '转入分店名称',
    `VerificationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '核销日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MonthlyId` int(11) NOT NULL DEFAULT 0 COMMENT '',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_MonthlyId(`MonthlyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '核销' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyVerification_201510`;
CREATE TABLE `FC_MonthlyVerification_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `OutBusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '转出业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `InBusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '转入业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `OutAccountingSubject` int(11) NOT NULL DEFAULT 0 COMMENT '转出账务科目',
    `InAccountingSubject` int(11) NOT NULL DEFAULT 0 COMMENT '转入账务科目',
    `OutCustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '转出客户ID',
    `OutCustomerName` varchar(255) COMMENT '转出客户名称',
    `OutSchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '转出方案ID',
    `OutSchemaName` varchar(255) COMMENT '转出方案名称',
    `OutShopId` int(11) NOT NULL DEFAULT 0 COMMENT '转出分店ID',
    `OutShopName` varchar(255) COMMENT '转出分店名称',
    `InCustomerId` int(11) NOT NULL DEFAULT 0 COMMENT '转入客户ID',
    `InCustomerName` varchar(255) COMMENT '转入客户名称',
    `InSchemaId` int(11) NOT NULL DEFAULT 0 COMMENT '转入方案ID',
    `InSchemaName` varchar(255) COMMENT '转入方案名称',
    `InShopId` int(11) NOT NULL DEFAULT 0 COMMENT '转入分店ID',
    `InShopName` varchar(255) COMMENT '转入分店名称',
    `VerificationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '核销日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `DailyId` int(11) NOT NULL DEFAULT 0 COMMENT '',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_DailyId(`DailyId`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度核销' ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `FC_MonthlyVerificationSummary_201510`;
CREATE TABLE `FC_MonthlyVerificationSummary_201510` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `AccountingMonth` int(11) NOT NULL DEFAULT 0 COMMENT '月份',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '月度核销汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;