ALTER TABLE `mb_perf_dst`
ADD COLUMN `target_ji`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '��Ŀ������ļ���Ŀ��' AFTER `dst_date`,
ADD COLUMN `target_yue`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '��Ŀ���������Ŀ��' AFTER `target_ji`,
ADD COLUMN `target_week`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '��Ŀ���������Ŀ��' AFTER `target_yue`,
ADD COLUMN `process`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '��������' AFTER `target_week`;

ALTER TABLE `mb_perf_dailylog`
MODIFY COLUMN `finish`  varchar(16) NULL DEFAULT 0 COMMENT '������ �ٷֱ�(��Ҫ��ԭ��)' AFTER `real_cost`;