CREATE TABLE `tb_december_wechat_public_activity` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '����ID',
  `userId` varchar(50) NOT NULL DEFAULT '' COMMENT '�û�ID',
  `realName` varchar(32) NOT NULL DEFAULT '' COMMENT '�û���',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '�û��ֻ���',
  `reward` varchar(32) NOT NULL DEFAULT '' COMMENT '��Ʒ��Դ',
  `ticketNo` varchar(255) DEFAULT '' COMMENT '��Ӱȯ',
  `dtLastNotice` varchar(32) NOT NULL DEFAULT '' COMMENT '�ϴζ���֪ͨʱ��',
  `flag` varchar(32) NOT NULL DEFAULT '' COMMENT '�Ƿ��ѷ��ͣ�0:δ��;1:�ѷ�',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='12��΢�Ź��ںŻ';

