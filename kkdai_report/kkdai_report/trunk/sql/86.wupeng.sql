CREATE TABLE `tb_activity_nov_20161130reward` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '����ID',
  `userId` varchar(50) NOT NULL DEFAULT '' COMMENT '�û�Id',
  `realName` varchar(32) NOT NULL DEFAULT '' COMMENT '�û���',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '�û��ֻ���',
  `reward` varchar(32) NOT NULL DEFAULT '' COMMENT '��Ʒ��Դ',
  `ticketNo` varchar(255) DEFAULT '' COMMENT '��Ӱȯ',
  `kahao` varchar(255) DEFAULT '' COMMENT '����',
  `mima` varchar(255) DEFAULT '' COMMENT '����',
  `dtLastNotice` varchar(32) NOT NULL DEFAULT '' COMMENT '�ϴζ���֪ͨʱ��',
  `flag` varchar(32) NOT NULL DEFAULT '' COMMENT '�Ƿ��ѷ��ͣ�0:δ��;1:�ѷ�',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='11�»���û���';

