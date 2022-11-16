CREATE TABLE `books-project`.`user` 
( `id` INT NOT NULL AUTO_INCREMENT , `name` VARCHAR NOT NULL , 
    `username` VARCHAR NOT NULL , `password` VARCHAR NOT NULL , PRIMARY KEY (`id`)) 
ENGINE = InnoDB COMMENT = 'Stores the sensitive user info (ex:login)';