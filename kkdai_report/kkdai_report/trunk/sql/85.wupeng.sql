CREATE TABLE `tb_activity_september_20161019reward` (
  `ymdStart` varchar(32) NOT NULL DEFAULT '' COMMENT '���ʼʱ��',
  `userId` varchar(50) NOT NULL DEFAULT '' COMMENT '�û�Id',
  `realName` varchar(32) NOT NULL DEFAULT '' COMMENT '�û���',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '�û��ֻ���',
  `reward` varchar(32) NOT NULL DEFAULT '' COMMENT '��Ʒ',
  `ticketNo` varchar(255) NOT NULL DEFAULT '' COMMENT '��Ӱȯ',
  `dtLastNotice` varchar(32) NOT NULL DEFAULT '' COMMENT '�ϴζ���֪ͨʱ��',
  `flag` varchar(32) NOT NULL DEFAULT '' COMMENT '�Ƿ��ѷ��ͣ�0:δ��;1:�ѷ�',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='9�»���û���';