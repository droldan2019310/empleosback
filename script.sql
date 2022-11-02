


CREATE DATABASE IF NOT EXISTS empleosdb;

USE empleosdb;

CREATE TABLE `empleosdb`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(15) NULL,
  `typeUser` INT NOT NULL,
  `address` VARCHAR(500) NULL,
  `categoryId` INT NULL,
  PRIMARY KEY (`iduser`));


CREATE TABLE `empleosdb`.`typeuser` (
  `idtypeuser` INT NOT NULL AUTO_INCREMENT,
  `typeuserDesc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtypeuser`));


CREATE TABLE `empleosdb`.`category` (
  `idcategory` INT NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(50) NOT NULL,
  `categoryDescription` VARCHAR(500) NULL,
  PRIMARY KEY (`idcategory`));

CREATE TABLE `empleosdb`.`employment` (
  `idemployment` INT NOT NULL AUTO_INCREMENT,
  `descriptionEmployment` VARCHAR(1000) NOT NULL,
  `availablePlace` INT NOT NULL,
  `scheduleJob` VARCHAR(450) NULL,
  `requirements` TEXT NULL,
  `education` TEXT NULL,
  `business` VARCHAR(100) NULL,
  `statusEmpleo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idemployment`));


CREATE TABLE `empleosdb`.`employment_has_user` (
  `idemployment_has_user` INT NOT NULL AUTO_INCREMENT,
  `employmentId` INT NOT NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`idemployment_has_user`));


ALTER TABLE `empleosdb`.`user` 
ADD INDEX `FK_typeUse_idx` (`typeUser` ASC) VISIBLE;
;
ALTER TABLE `empleosdb`.`user` 
ADD CONSTRAINT `FK_typeUse`
  FOREIGN KEY (`typeUser`)
  REFERENCES `empleosdb`.`typeuser` (`idtypeuser`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  
  ALTER TABLE `empleosdb`.`employment` 
ADD COLUMN `categoryId` INT NULL AFTER `statusEmpleo`,
ADD INDEX `fk_cateogy_employment_idx` (`categoryId` ASC) VISIBLE;
;
ALTER TABLE `empleosdb`.`employment` 
ADD CONSTRAINT `fk_cateogy_employment`
  FOREIGN KEY (`categoryId`)
  REFERENCES `empleosdb`.`category` (`idcategory`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



ALTER TABLE `empleosdb`.`user` 
ADD INDEX `FK_category_user_idx` (`categoryId` ASC) VISIBLE;
;
ALTER TABLE `empleosdb`.`user` 
ADD CONSTRAINT `FK_category_user`
  FOREIGN KEY (`categoryId`)
  REFERENCES `empleosdb`.`category` (`idcategory`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



ALTER TABLE `empleosdb`.`employment_has_user` 
ADD INDEX `FK_userHas_idx` (`userId` ASC) VISIBLE;
;
ALTER TABLE `empleosdb`.`employment_has_user` 
ADD CONSTRAINT `FK_userHas`
  FOREIGN KEY (`userId`)
  REFERENCES `empleosdb`.`user` (`iduser`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `empleosdb`.`employment_has_user` 
ADD INDEX `FK_employmentHas_idx` (`employmentId` ASC) VISIBLE;
;
ALTER TABLE `empleosdb`.`employment_has_user` 
ADD CONSTRAINT `FK_employmentHas`
  FOREIGN KEY (`employmentId`)
  REFERENCES `empleosdb`.`employment` (`idemployment`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


