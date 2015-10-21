
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