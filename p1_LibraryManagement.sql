-- -----------------------------------------------------
-- Schema LibraryManagement
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LibraryManagement` ;
USE `LibraryManagement` ;

-- -----------------------------------------------------
-- Table `LibraryManagement`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibraryManagement`.`authors` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`author_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibraryManagement`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibraryManagement`.`genres` (
  `genre_id` INT NOT NULL AUTO_INCREMENT,
  `genre_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibraryManagement`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibraryManagement`.`books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(1024) NOT NULL,
  `publication_year` YEAR NOT NULL,
  `author_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`book_id`),
  INDEX `fk_books_1_idx` (`author_id` ASC) VISIBLE,
  INDEX `fk_books_2_idx` (`genre_id` ASC) VISIBLE,
  CONSTRAINT `fk_books_1`
    FOREIGN KEY (`author_id`)
    REFERENCES `LibraryManagement`.`authors` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_2`
    FOREIGN KEY (`genre_id`)
    REFERENCES `LibraryManagement`.`genres` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibraryManagement`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibraryManagement`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LibraryManagement`.`borrowed_books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LibraryManagement`.`borrowed_books` (
  `borrow_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `borrow_date` DATE NOT NULL,
  `return_date` DATE NULL,
  PRIMARY KEY (`borrow_id`),
  INDEX `fk_borrowed_books_1_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_borrowed_books_2_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_borrowed_books_1`
    FOREIGN KEY (`book_id`)
    REFERENCES `LibraryManagement`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_borrowed_books_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `LibraryManagement`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

