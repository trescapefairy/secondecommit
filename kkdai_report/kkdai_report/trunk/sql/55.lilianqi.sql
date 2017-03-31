DROP TABLE  IF EXISTS `tb_account_bill`;
CREATE TABLE `tb_account_bill`(
  `billId` varchar(255) NOT NULL comment '账单Id',
  `aheadAmount` bigint(20) DEFAULT NULL,
  `waresId` varchar(255) DEFAULT NULL,
  `ymdBill` int(11) not null default 0 comment '账单创建日期',
  `hisBill` int(11) not null default 0 comment '账单创建时间',
  `billNum` int(11) DEFAULT 0 comment '账单序号',
  `billType` varchar(255) DEFAULT '' comment '账单类型 302 等额本息, 303 先息后本',
  `userId` varchar(255) DEFAULT '' comment '客户Id',
  `interest` bigint(20) DEFAULT 0 comment '利息',
  `lendingId` varchar(255) DEFAULT '' comment '借贷Id',
  `overheadCharges` bigint(20) DEFAULT 0 comment '',
  `ymdPayment` int(11) not null default 0 comment '支付日期',
  `hisPayment` int(11) not null default 0 comment '支付时间',
  `paymentMoney` bigint(20) not null default 0 comment '支付金额',
  `paymentStatus` int(11) not null DEFAULT 0 comment '支付状态: 202 还清, 201未还清, 2020 还清 ',
  `penaltyInteret` bigint(20) not NULL default 0 comment '罚息',
  `principal` bigint(20) not NULL default 0 comment '本金',
  `serviceCharge` bigint(20) not null default 0 comment '服务费',
  `ymdShouldPay` int(11) not null default 0 comment '合约还款日',
  `finish` int(11) not NULL default 0 comment '是否所有已经还清: 0 否, 1 是',
  `shelfId` int(11) not null DEFAULT '1' comment '标的类型: 0 天天赚, 1 定期宝, 2 房宝宝, 5 精英宝',
  `custInterest` bigint(20) not null DEFAULT '0' comment '',
  `custPrincipal` bigint(20) not null DEFAULT '0' comment '',
  `custPenaltyInteret` bigint(20) not null DEFAULT '0' comment '',
  `freezeAmount` bigint(20) not null DEFAULT '0',
  `freezeOrdId` varchar(32) not null DEFAULT '',
  `unfreezeOrdId` varchar(32) not null DEFAULT '',
  `freezeStatus` int(11) not null DEFAULT '0',
  PRIMARY KEY (`billId`),
  KEY `bill_bid_id` (`waresId`),
  KEY `bill_customer_id` (`userId`),
  KEY `inx_shouldpay_date` (`ymdShouldPay`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账单';
insert into db_kkrpt.tb_config set k='dbsql.ver',v='55.lilianqi' ON DUPLICATE KEY UPDATE v='55.lilianqi';