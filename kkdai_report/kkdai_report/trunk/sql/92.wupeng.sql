ALTER TABLE `mb_message`
ADD COLUMN `reply_id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '�ظ���id' AFTER `perf_id`