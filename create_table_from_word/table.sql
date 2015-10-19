DROP TABLE IF EXISTS `FC_AccountingDimensionConfig`;
CREATE TABLE `FC_AccountingDimensionConfig` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购',
    `Demension` tinyint(4) COMMENT '结账纬度 1 客户Id 2 方案ID 3 shopID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2 无效',
    PRIMARY KEY (`Id`)
) COMMENT '结账纬度配置' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginAccountPayable`;
CREATE TABLE `FC_OriginAccountPayable` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) COMMENT '业务系统来源  1 团购 2 推广',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CustomerId` int(11) COMMENT '客户ID',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `AccountingDate` timestamp COMMENT '应付日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `APId` int(11) COMMENT '应付ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2 无效',
    PRIMARY KEY (`Id`)
) COMMENT '原始应付明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginAPExtendInfo`;
CREATE TABLE `FC_OriginAPExtendInfo` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `OAPId` int(11) COMMENT '原始应付明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2 无效',
    PRIMARY KEY (`Id`)
) COMMENT '原始应付明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_AccountPayable`;
CREATE TABLE `FC_AccountPayable` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `CustomerId` int(11) COMMENT '客户ID',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `AccountingDate` timestamp COMMENT '应付日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MAPId` int(11) COMMENT '月度应付ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2 无效',
    PRIMARY KEY (`Id`)
) COMMENT '应付' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyAccountPayable`;
CREATE TABLE `FC_MonthlyAccountPayable` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `CustomerId` int(11) COMMENT '客户ID',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `AccountingMonth` varchar(16) COMMENT '应付月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2 无效',
    PRIMARY KEY (`Id`)
) COMMENT '月度应付' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyAPSummary`;
CREATE TABLE `FC_MonthlyAPSummary` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `AccountingMonth` varchar(16) COMMENT '应付月份',
    `CompanyId` int(11) COMMENT '公司ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2 无效',
    PRIMARY KEY (`Id`)
) COMMENT '月度应付汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginAccountReceivable`;
CREATE TABLE `FC_OriginAccountReceivable` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) COMMENT '业务系统来源 1 团购 2 推广',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CustomerId` int(11) COMMENT '客户ID',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `AccountingDate` timestamp COMMENT '应收日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `ARId` int(11) COMMENT '应收ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2 无效',
    PRIMARY KEY (`Id`)
) COMMENT '原始应收明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginARExtendInfo`;
CREATE TABLE `FC_OriginARExtendInfo` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `OARId` int(11) COMMENT '原始应收明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2 无效',
    PRIMARY KEY (`Id`)
) COMMENT '原始应收明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_AccountReceivable`;
CREATE TABLE `FC_AccountReceivable` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `AccountingDate` timestamp COMMENT '应收日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MARId` int(11) COMMENT '月度应收ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '应收' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyAccountReceivable`;
CREATE TABLE `FC_MonthlyAccountReceivable` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `AccountingMonth` varchar(16) COMMENT '应收月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `MARSId` int(11) COMMENT '月度汇总ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '月度应收' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyARSummary`;
CREATE TABLE `FC_MonthlyARSummary` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购',
    `AccountingMonth` varchar(16) COMMENT '应收月份',
    `CompanyId` int(11) COMMENT '公司ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '月度应收汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_PaymentType`;
CREATE TABLE `FC_PaymentType` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `TypeName` varchar(64) COMMENT '付款类型名称 1 预付款付款（银行） 2 应付款付款 3 点付宝提现 4 保证金付款',
    `TypeDescription` varchar(255) COMMENT '付款类型描述',
    `TypeNo` varchar(16) COMMENT '付款类型编号',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '付款类型' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginPayment`;
CREATE TABLE `FC_OriginPayment` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) COMMENT '业务系统来源 1 团购 2 推广',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `PaymentTypeId` int(11) COMMENT '付款类型',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `PayChannel` tinyint(4) COMMENT '付款渠道 1 银行 2 支付宝 3 微信',
    `PayEntityId` int(11) COMMENT '付款实体ID',
    `PaymentDate` timestamp COMMENT '付款日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `PaymentId` int(11) COMMENT '付款ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '原始付款明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginPaymentExtendInfo`;
CREATE TABLE `FC_OriginPaymentExtendInfo` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `OPId` int(11) COMMENT '原始付款明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2 无效',
    PRIMARY KEY (`Id`)
) COMMENT '原始付款明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_Payment`;
CREATE TABLE `FC_Payment` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购',
    `PaymentTypeId` int(11) COMMENT '付款类型',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `PayChannel` tinyint(4) COMMENT '付款渠道 1 银行 2 支付宝 3 微信',
    `PayEntityId` int(11) COMMENT '付款实体ID',
    `PaymentDate` timestamp COMMENT '付款日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MPId` int(11) COMMENT '月度付款ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '付款' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyPayment`;
CREATE TABLE `FC_MonthlyPayment` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购',
    `PaymentTypeId` int(11) COMMENT '付款类型',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `PayChannel` tinyint(4) COMMENT '付款渠道 1 银行 2 支付宝 3 微信',
    `PayEntityId` int(11) COMMENT '付款实体ID',
    `PaymentMonth` varchar(16) COMMENT '付款月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `MPSId` int(11) COMMENT '月度汇总ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '月度付款' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyPaymentSummary`;
CREATE TABLE `FC_MonthlyPaymentSummary` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购',
    `PaymentTypeId` int(11) COMMENT '付款类型',
    `PaymentMonth` varchar(16) COMMENT '付款月份',
    `CompanyId` int(11) COMMENT '公司ID',
    `PayChannel` tinyint(4) COMMENT '付款渠道 1 银行 2 支付宝 3 微信',
    `PayEntityId` int(11) COMMENT '付款实体ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '月度付款汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_CollectionType`;
CREATE TABLE `FC_CollectionType` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `TypeName` varchar(64) COMMENT '收款类型名称1 押金 2 赔偿 3 上架费 4 充值',
    `TypeDescription` varchar(255) COMMENT '付款类型描述',
    `TypeNo` varchar(16) COMMENT '付款类型编号',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '收款类型' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginCollection`;
CREATE TABLE `FC_OriginCollection` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) COMMENT '业务系统来源 1 团购 2 推广',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CollectionTypeId` int(11) COMMENT '收款类型',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `ReceiveChannel` tinyint(4) COMMENT '收款渠道 1 银行 2 支付宝 3 微信',
    `ReceiveEntityId` int(11) COMMENT '收款实体ID',
    `CollectionDate` timestamp COMMENT '收款日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `CollectionId` int(11) COMMENT '收款ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '原始收款明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginCollectionExtendInfo`;
CREATE TABLE `FC_OriginCollectionExtendInfo` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `OCId` int(11) COMMENT '原始收款明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2 无效',
    PRIMARY KEY (`Id`)
) COMMENT '原始收款明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_Collection`;
CREATE TABLE `FC_Collection` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '产品线 1团购',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CollectionTypeId` int(11) COMMENT '收款类型',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `ReceiveChannel` tinyint(4) COMMENT '收款渠道 1 银行 2 支付宝 3 微信',
    `ReceiveEntityId` int(11) COMMENT '收款实体ID',
    `CollectionDate` timestamp COMMENT '收款日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MCId` int(11) COMMENT '月度收款Id',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '收款' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyCollection`;
CREATE TABLE `FC_MonthlyCollection` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '产品线 1团购',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CollectionTypeId` int(11) COMMENT '收款类型',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `ReceiveChannel` tinyint(4) COMMENT '收款渠道 1 银行 2 支付宝 3 微信',
    `ReceiveEntityId` int(11) COMMENT '收款实体ID',
    `CollectionMonth` varchar(16) COMMENT '收款月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `MCSId` int(11) COMMENT '月度汇总ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '月度收款' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyCollectionSummary`;
CREATE TABLE `FC_MonthlyCollectionSummary` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '产品线 1团购',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CollectionTypeId` int(11) COMMENT '收款类型',
    `CollectionMonth` varchar(16) COMMENT '收款月份',
    `CompanyId` int(11) COMMENT '公司ID',
    `ReceiveChannel` tinyint(4) COMMENT '收款渠道 1 银行 2 支付宝 3 微信',
    `ReceiveEntityId` int(11) COMMENT '收款实体ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '月度收款汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginPrePayment`;
CREATE TABLE `FC_OriginPrePayment` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) COMMENT '业务系统来源 1 团购 2 推广',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `AccountingDate` timestamp COMMENT '预付日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `PrePaymentId` int(11) COMMENT '预付ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '原始预付明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginPrePaymentExtendInfo`;
CREATE TABLE `FC_OriginPrePaymentExtendInfo` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `OPPId` int(11) COMMENT '原始预付明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2 无效',
    PRIMARY KEY (`Id`)
) COMMENT '原始预付明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_PrePayment`;
CREATE TABLE `FC_PrePayment` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型1团购',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `AccountingDate` timestamp COMMENT '预付日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MPPId` int(11) COMMENT '月度预付ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '预付' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyPrePayment`;
CREATE TABLE `FC_MonthlyPrePayment` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型1团购',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `AccountingMonth` varchar(16) COMMENT '预付月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `MPPSId` int(11) COMMENT '月度汇总Id',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '月度预付' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyPrePaymentSummary`;
CREATE TABLE `FC_MonthlyPrePaymentSummary` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型1团购',
    `AccountingMonth` varchar(16) COMMENT '预付月份',
    `CompanyId` int(11) COMMENT '公司ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '月度预付汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginPreCollection`;
CREATE TABLE `FC_OriginPreCollection` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) COMMENT '业务系统来源 1 团购 2 推广',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `AccountingDate` timestamp COMMENT '预收日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `PreCollectionId` int(11) COMMENT '预收ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '原始预收明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginPreCollectionExtendInfo`;
CREATE TABLE `FC_OriginPreCollectionExtendInfo` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `OPCId` int(11) COMMENT '原始预收明细ID',
    `VarName` varchar(64) COMMENT '属性名称',
    `VarValue` varchar(255) COMMENT '属性值',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2 无效',
    PRIMARY KEY (`Id`)
) COMMENT '原始预收明细扩展信息' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_PreCollection`;
CREATE TABLE `FC_PreCollection` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型1团购',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `CollectionDate` timestamp COMMENT '收款日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MPCId` int(11) COMMENT '月度预收ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '预收' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyPreCollection`;
CREATE TABLE `FC_MonthlyPreCollection` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型1团购',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `PreCollectionMonth` varchar(16) COMMENT '预收月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `MPCSId` int(11) COMMENT '月度汇总Id',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '月度预收' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyPreCollectionSummary`;
CREATE TABLE `FC_MonthlyPreCollectionSummary` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型1团购',
    `PreCollectionMonth` varchar(16) COMMENT '预收月份',
    `CompanyId` int(11) COMMENT '公司ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '月度预收汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_OriginBadDebt`;
CREATE TABLE `FC_OriginBadDebt` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) COMMENT '业务系统来源 1 团购 2 推广',
    `BusinessType` tinyint(4) COMMENT '业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `BadDebtDate` timestamp COMMENT '坏账确认日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `MBDId` int(11) COMMENT '月度坏账ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '原始坏账明细' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyBadDebt`;
CREATE TABLE `FC_MonthlyBadDebt` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型 1团购',
    `CustomerId` int(11) COMMENT '客户Id',
    `SchemaId` int(11) COMMENT '方案ID',
    `ShopId` int(11) COMMENT '分店ID',
    `CompanyId` int(11) COMMENT '公司ID',
    `BadDebtMonth` varchar(16) COMMENT '坏账确认月份',
    `Amount` decimal(10,2) COMMENT '金额',
    `MBDSId` int(11) COMMENT '月度汇总ID',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '月度坏账' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_MonthlyBadDebtSummary`;
CREATE TABLE `FC_MonthlyBadDebtSummary` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` tinyint(4) COMMENT '业务类型 1团购',
    `BadDebtMonth` varchar(16) COMMENT '坏账确认月份',
    `CompanyId` int(11) COMMENT '公司ID',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '月度坏账汇总' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_Invoice`;
CREATE TABLE `FC_Invoice` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessType` int(11) COMMENT '业务类型 1 团购',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `CustomerId` int(11) COMMENT '客户Id',
    `InvoiceHeader` varchar(255) COMMENT '发票抬头',
    `Amount` decimal(10,2) COMMENT '发票金额',
    `InvoiceDate` timestamp COMMENT '发票日期',
    `TaxNumber` varchar(32) COMMENT '税号',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '开票' ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `FC_Verification`;
CREATE TABLE `FC_Verification` (
    `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `BusinessSource` tinyint(4) COMMENT '业务系统来源 1 团购 2 推广',
    `OutBusinessType` tinyint(4) COMMENT '转出业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `InBusinessType` tinyint(4) COMMENT '转入业务类型 1 团购 2 闪惠 3 闪付 4 电影 5 推广',
    `OutBizId` varchar(32) COMMENT '外部业务号',
    `OutAccountingSubject` tinyint(4) COMMENT '转出账务科目',
    `InAccountingSubject` tinyint(4) COMMENT '转入账务科目',
    `OutCustomerId` int(11) COMMENT '转出客户Id',
    `OutSchemaId` int(11) COMMENT '转出方案Id',
    `OutShopId` int(11) COMMENT '转出分店Id',
    `InCustomerId` int(11) COMMENT '转入客户Id',
    `InSchemaId` int(11) COMMENT '转入方案Id',
    `InShopId` int(11) COMMENT '转入分店Id',
    `VerificationDate` timestamp COMMENT '核销日期',
    `Amount` decimal(10,2) COMMENT '金额',
    `AddTime` timestamp COMMENT '添加时间',
    `UpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    `RecordState` tinyint(1) NOT NULL DEFAULT 1 COMMENT '记录状态 1 有效 2',
    PRIMARY KEY (`Id`)
) COMMENT '核销' ENGINE=InnoDB DEFAULT CHARSET=utf8;