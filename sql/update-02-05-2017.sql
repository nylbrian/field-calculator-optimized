use `field_calculator`;

ALTER TABLE `field_calculator`.`users`  ADD COLUMN `role` TINYINT NOT NULL DEFAULT 1 COMMENT '' AFTER `last_login`;
