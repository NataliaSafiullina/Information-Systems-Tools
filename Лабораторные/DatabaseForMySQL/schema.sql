-- mysql --
DROP DATABASE IF EXISTS `my_db`;
CREATE DATABASE `my_db`;

CREATE TABLE `my_db`.`user` (
    `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `registration_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `login` VARCHAR(255) NOT NULL,
    `password_hash` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `date_of_birth` DATE,
    `metadata` JSON,
    `is_active` BOOL NOT NULL,
    `registration_type` enum('email', 'facebook', 'vk', 'google') NOT NULL DEFAULT 'email',
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `login` (`login`),
    KEY `registration_time` (`registration_time`)
);

CREATE TABLE `my_db`.`discussion_group` (
    `group_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `creation_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `group_tags` JSON NOT NULL,
    `admin_user_id` INT UNSIGNED NOT NULL,
    `approve_required` BOOL NOT NULL DEFAULT 0,
    PRIMARY KEY (`group_id`),
    KEY `creation_time`(`creation_time`),
    FOREIGN KEY (`admin_user_id`)
        REFERENCES `my_db`.`user`(`user_id`)
        ON DELETE RESTRICT
);




CREATE TABLE `my_db`.`user_group_post` (
    `post_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT UNSIGNED,
    `group_id` INT UNSIGNED NOT NULL,
    `creation_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `post_text` TEXT NOT NULL,
    `post_type` ENUM('default', 'pinned', 'special'),
    PRIMARY KEY (`post_id`),
    KEY `creation_time`(`creation_time`),
    FOREIGN KEY (`user_id`)
        REFERENCES `my_db`.`user`(`user_id`)
        ON DELETE SET NULL,
    FOREIGN KEY (`group_id`)
        REFERENCES `my_db`.`discussion_group`(`group_id`)
        ON DELETE CASCADE
);

CREATE TABLE `my_db`.`users_to_discussion_groups` (
    `user_id` INT UNSIGNED NOT NULL,
    `group_id` INT UNSIGNED NOT NULL,
    `joined_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `approved` BOOL NOT NULL,
    `approved_time` TIMESTAMP,
    KEY `joined_time`(`joined_time`),
    FOREIGN KEY (`user_id`)
        REFERENCES `my_db`.`user`(`user_id`)
        ON DELETE CASCADE,
    FOREIGN KEY (`group_id`)
        REFERENCES `my_db`.`discussion_group`(`group_id`)
        ON DELETE CASCADE
);

CREATE TABLE `my_db`.`user_private_message` (
    `message_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_from_id` INT UNSIGNED,
    `user_to_id` INT UNSIGNED,
    `send_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `is_read` BOOL NOT NULL,
    `read_time` TIMESTAMP DEFAULT NULL,
    `message_text` TEXT NOT NULL,
    PRIMARY KEY(`message_id`),
    KEY `send_time` (`send_time`),
    FOREIGN KEY (`user_from_id`)
        REFERENCES `my_db`.`user`(`user_id`)
        ON DELETE SET NULL,
    FOREIGN KEY (`user_to_id`)
        REFERENCES `my_db`.`user`(`user_id`)
        ON DELETE SET NULL
);

