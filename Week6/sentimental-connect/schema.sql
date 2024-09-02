CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,

    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `user_name` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(32) NOT NULL,

    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `type` ENUM(
        'Elementary School', 'Middle School', 'High School',
        'Lower School', 'Upper School', 'College', 'University'
    ) NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    `founded_year` SMALLINT UNSIGNED NOT NULL CHECK(`founded_year` > 0),

    PRIMARY KEY (`id`)
);

CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `industry` ENUM ('Eduaction', 'Technology', 'Finance') NOT NULL,
    `location` VARCHAR(32) NOT NULL,

    PRIMARY KEY(`id`)
);

CREATE TABLE `people_connections` (
    `id` INT AUTO_INCREMENT,

    `user_id` INT,
    `user_follow_id` INT,

    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user_follow_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `school_connections` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `school_id` INT,

    `start_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `end_date` DATETIME,

    `degree` ENUM('BA', 'MA', 'PhD') NOT NULL,

    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `company_connections` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `company_id` INT,

    `start_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `end_date` DATETIME,

    `title` VARCHAR(16) NOT NULL,

    PRIMARY KEY(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`)
);
