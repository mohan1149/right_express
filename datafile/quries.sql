ALTER TABLE `contacts` CHANGE `custom_field4` `custom_field4` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'customer area'; 
ALTER TABLE contacts ADD COLUMN total_paid_value int ;
ALTER TABLE `contacts` CHANGE `total_paid_value` `total_paid_value` INT(11) NULL DEFAULT '0' COMMENT 'Total subscription value'; 
ALTER TABLE `tbl_outside_orders` CHANGE `order_date` `order_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP; 