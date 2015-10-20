DROP TABLE IF EXISTS `FC_AccountingDimensionConfig`;
CREATE TABLE `FC_AccountingDimensionConfig` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) NOT NULL DEFAULT 0 COMMENT '业务类型: 1团购, 2预约预订, 3结婚亲子, 4储值卡, 5广告, 6闪惠, 7费用, 8闪付, 9电影, 10点菜, 11KTV预订, 12点付宝',
    `Dimension` varchar(64) COMMENT '结账纬度 1 客户Id 2 方案ID 3 shopID',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '结账纬度配置' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_AccountingAccessToken`;
CREATE TABLE `FC_AccountingAccessToken` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `AccessToken` varchar(64) COMMENT '授权码',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '授权码表' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginAccountPayable`;
CREATE TABLE `FC_OriginAccountPayable` (
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

DROP TABLE IF EXISTS `FC_OriginAPExtendInfo`;
CREATE TABLE `FC_OriginAPExtendInfo` (
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

DROP TABLE IF EXISTS `FC_AccountPayable`;
CREATE TABLE `FC_AccountPayable` (
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

DROP TABLE IF EXISTS `FC_MonthlyAccountPayable`;
CREATE TABLE `FC_MonthlyAccountPayable` (
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

DROP TABLE IF EXISTS `FC_MonthlyAPSummary`;
CREATE TABLE `FC_MonthlyAPSummary` (
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

DROP TABLE IF EXISTS `FC_OriginAccountReceivable`;
CREATE TABLE `FC_OriginAccountReceivable` (
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

DROP TABLE IF EXISTS `FC_OriginARExtendInfo`;
CREATE TABLE `FC_OriginARExtendInfo` (
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

DROP TABLE IF EXISTS `FC_AccountReceivable`;
CREATE TABLE `FC_AccountReceivable` (
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

DROP TABLE IF EXISTS `FC_MonthlyAccountReceivable`;
CREATE TABLE `FC_MonthlyAccountReceivable` (
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

DROP TABLE IF EXISTS `FC_MonthlyARSummary`;
CREATE TABLE `FC_MonthlyARSummary` (
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

DROP TABLE IF EXISTS `FC_PaymentType`;
CREATE TABLE `FC_PaymentType` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `Name` varchar(64) COMMENT '付款类型名称 1 预付款付款（银行） 2 应付款付款 3 点付宝提现 4 保证金付款',
    `Description` varchar(255) COMMENT '付款类型描述',
    `Code` varchar(16) COMMENT '付款类型编号',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '付款类型' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginPayment`;
CREATE TABLE `FC_OriginPayment` (
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

DROP TABLE IF EXISTS `FC_OriginPaymentExtendInfo`;
CREATE TABLE `FC_OriginPaymentExtendInfo` (
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

DROP TABLE IF EXISTS `FC_Payment`;
CREATE TABLE `FC_Payment` (
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

DROP TABLE IF EXISTS `FC_MonthlyPayment`;
CREATE TABLE `FC_MonthlyPayment` (
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

DROP TABLE IF EXISTS `FC_MonthlyPaymentSummary`;
CREATE TABLE `FC_MonthlyPaymentSummary` (
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

DROP TABLE IF EXISTS `FC_CollectionType`;
CREATE TABLE `FC_CollectionType` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `Name` varchar(64) COMMENT '收款类型名称1 押金 2 赔偿 3 上架费 4 充值',
    `Description` varchar(255) COMMENT '付款类型描述',
    `Code` varchar(16) COMMENT '付款类型编号',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '收款类型' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginCollection`;
CREATE TABLE `FC_OriginCollection` (
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

DROP TABLE IF EXISTS `FC_OriginCollectionExtendInfo`;
CREATE TABLE `FC_OriginCollectionExtendInfo` (
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

DROP TABLE IF EXISTS `FC_Collection`;
CREATE TABLE `FC_Collection` (
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

DROP TABLE IF EXISTS `FC_MonthlyCollection`;
CREATE TABLE `FC_MonthlyCollection` (
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

DROP TABLE IF EXISTS `FC_MonthlyCollectionSummary`;
CREATE TABLE `FC_MonthlyCollectionSummary` (
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

DROP TABLE IF EXISTS `FC_OriginPrePayment`;
CREATE TABLE `FC_OriginPrePayment` (
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

DROP TABLE IF EXISTS `FC_OriginPrePaymentExtendInfo`;
CREATE TABLE `FC_OriginPrePaymentExtendInfo` (
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

DROP TABLE IF EXISTS `FC_PrePayment`;
CREATE TABLE `FC_PrePayment` (
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

DROP TABLE IF EXISTS `FC_MonthlyPrePayment`;
CREATE TABLE `FC_MonthlyPrePayment` (
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

DROP TABLE IF EXISTS `FC_MonthlyPrePaymentSummary`;
CREATE TABLE `FC_MonthlyPrePaymentSummary` (
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

DROP TABLE IF EXISTS `FC_OriginPreCollection`;
CREATE TABLE `FC_OriginPreCollection` (
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

DROP TABLE IF EXISTS `FC_OriginPreCollectionExtendInfo`;
CREATE TABLE `FC_OriginPreCollectionExtendInfo` (
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

DROP TABLE IF EXISTS `FC_PreCollection`;
CREATE TABLE `FC_PreCollection` (
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

DROP TABLE IF EXISTS `FC_MonthlyPreCollection`;
CREATE TABLE `FC_MonthlyPreCollection` (
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

DROP TABLE IF EXISTS `FC_MonthlyPreCollectionSummary`;
CREATE TABLE `FC_MonthlyPreCollectionSummary` (
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

DROP TABLE IF EXISTS `FC_OriginBadDebtExtendInfo`;
CREATE TABLE `FC_OriginBadDebtExtendInfo` (
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

DROP TABLE IF EXISTS `FC_OriginBadDebt`;
CREATE TABLE `FC_OriginBadDebt` (
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

DROP TABLE IF EXISTS `FC_MonthlyBadDebt`;
CREATE TABLE `FC_MonthlyBadDebt` (
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

DROP TABLE IF EXISTS `FC_MonthlyBadDebtSummary`;
CREATE TABLE `FC_MonthlyBadDebtSummary` (
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

DROP TABLE IF EXISTS `FC_OriginInvoiceExtendInfo`;
CREATE TABLE `FC_OriginInvoiceExtendInfo` (
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

DROP TABLE IF EXISTS `FC_OriginInvoice`;
CREATE TABLE `FC_OriginInvoice` (
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

DROP TABLE IF EXISTS `FC_Invoice`;
CREATE TABLE `FC_Invoice` (
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

DROP TABLE IF EXISTS `FC_MonthlyInvoice`;
CREATE TABLE `FC_MonthlyInvoice` (
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

DROP TABLE IF EXISTS `FC_MonthlyInvoiceSummary`;
CREATE TABLE `FC_MonthlyInvoiceSummary` (
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

DROP TABLE IF EXISTS `FC_OriginVerificationExtendInfo`;
CREATE TABLE `FC_OriginVerificationExtendInfo` (
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

DROP TABLE IF EXISTS `FC_OriginVerification`;
CREATE TABLE `FC_OriginVerification` (
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

DROP TABLE IF EXISTS `FC_Verification`;
CREATE TABLE `FC_Verification` (
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

DROP TABLE IF EXISTS `FC_MonthlyVerification`;
CREATE TABLE `FC_MonthlyVerification` (
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

DROP TABLE IF EXISTS `FC_MonthlyVerificationSummary`;
CREATE TABLE `FC_MonthlyVerificationSummary` (
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

DROP TABLE IF EXISTS `FC_JeHistory`;
CREATE TABLE `FC_JeHistory` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BatchNum` varchar(240) COMMENT '导入的批标识',
    `GroupId` int(11) NOT NULL DEFAULT 0 COMMENT '凭证分组ID',
    `BusinessSource` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据来源: 1天玑 2账务 3结算 4推广 5支付中心',
    `BusinessCatagory` varchar(125) COMMENT '业务系统分类（大类）',
    `BusinessDetailedCategory` varchar(125) COMMENT '业务系统明细分类（小类）',
    `CompanyId` int(11) NOT NULL DEFAULT 0 COMMENT '公司ID',
    `BankId` int(11) NOT NULL DEFAULT 0 COMMENT '银行ID?(支付宝？)',
    `Algorithm` varchar(125) COMMENT '准则 PRC/US',
    `GLDate` date COMMENT 'GL日期',
    `PeriodName` varchar(100) COMMENT '期间（2010-01）',
    `Currency` varchar(10) COMMENT 'CNY/USD/HKD',
    `CurrencyRateType` varchar(20) COMMENT 'User/Corporate',
    `CurrencyRateDate` date COMMENT '汇率时间',
    `CurrencyRate` decimal(16,6) COMMENT '原币金额',
    `Amount` decimal(16,6) COMMENT '本位币金额',
    `CreationDate` datetime COMMENT '数据创建日期，精确到秒',
    `CreatedBy` varchar(100) COMMENT '数据创建者',
    `RequestId` int(11) NOT NULL DEFAULT 0 COMMENT '',
    `CityId` varchar(64) COMMENT '城市ID',
    `DepartmentId` varchar(64) COMMENT '部门ID',
    `DepartmentName` varchar(255) COMMENT '部门名称',
    `GLSubAccount` varchar(255) COMMENT '子目类',
    `EmpType` varchar(32) COMMENT '员工类型',
    `AddTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordStatus` tinyint(4) NOT NULL DEFAULT 1 COMMENT '记录状态: 1 有效, 2 无效',
    PRIMARY KEY (`Id`),
    KEY IX_UpdateTime(`UpdateTime`),
    KEY IX_AddTime(`AddTime`)
) COMMENT '财务凭证中间表' ENGINE=InnoDB DEFAULT CHARSET=utf8;