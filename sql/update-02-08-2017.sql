ALTER TABLE `field_calculator`.`sessions`
CHANGE COLUMN `data` `data` TEXT NULL DEFAULT NULL COMMENT '' ;

ALTER TABLE `field_calculator`.`farmers`
ADD COLUMN `users_id` INT NOT NULL DEFAULT 0 COMMENT '' AFTER `import`;
