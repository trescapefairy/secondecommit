
ALTER TABLE `mb_perf_dailylog`
MODIFY COLUMN `plan_cost`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 0 COMMENT '�ƻ���ʱ(Сʱ)' AFTER `type`,
MODIFY COLUMN `real_cost`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 0 COMMENT 'ʵ����ʱ(Сʱ��' AFTER `plan_cost`;

ALTER TABLE `mb_message`
ADD COLUMN `perf_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Ŀ���Խ�id������־�Խ���id' AFTER `dstid`;

ALTER TABLE `mb_perf_dst`
ADD COLUMN `settime`  date NOT NULL COMMENT 'Ŀ������' AFTER `id`,
ADD COLUMN `staffname`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Ա������' AFTER `settime`;

ALTER TABLE `mb_perf_dailylog`
ADD COLUMN `settime`  date NOT NULL COMMENT '��־����' AFTER `id`,
ADD COLUMN `staffname`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Ա������' AFTER `settime`;


update db_kkrpt.tb_menu set value='["plan","perfdailylog","index",{"targetTab":"list"},[],"perf"]' where id=1002;