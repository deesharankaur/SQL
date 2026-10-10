/*
Create a MySQL database for LinkedIn from scratch. 
The implementation details are up to you, though you should minimally ensure that your database meets the platform’s specification and
that it can represent the given sample data. 
You’re welcome to use, or improve upon, your design of a SQLite database—just keep in mind that 
you’ll now have a new set of types at your disposal!
write a set of SQL statements to design a MySQL database schema that LinkedIn could use.

*/

CREATE TABLE `Users`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL,
    `password` VARCHAR(522) NOT NULL
);

CREATE TABLE `Schools_and_Univeristies`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `school_name` VARCHAR(100) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(100),
    `establshed_year` YEAR NOT NULL
);

CREATE TABLE `Companies`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `industry` ENUM('Technology', 'Education' , 'Business') NOT NULL,
    `location` VARCHAR(100),
);

CREATE TABLE `Connections_people`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL
    FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE `Connections_school`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `school_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `graduated_year` DATE,
    `degree` VARCHAR(32),
    FOREIGN KEY(`school_id`) REFERENCES `Schools_and_Univeristies`(`id`)
);

CREATE TABLE `Connections_company`(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `company_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    FOREIGN KEY(`company_id`) REFERENCES `Companies`(`id`)
);
