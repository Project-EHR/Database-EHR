CREATE SCHEMA IF NOT EXISTS ehr;
USE ehr;


CREATE TABLE IF NOT EXISTS departamento (
  `iddepartamento` INT NOT NULL,
  `nombre` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`iddepartamento`));

CREATE TABLE IF NOT EXISTS municipios (
  `idmunicipio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(120) NOT NULL,
  `departamento` INT NOT NULL,
  PRIMARY KEY (`idmunicipio`),
  INDEX `municipio_departamento` (`departamento` ASC),
  CONSTRAINT `municipio_departamento`
    FOREIGN KEY (`departamento`)
    REFERENCES `departamento` (`iddepartamento`));



CREATE TABLE IF NOT EXISTS usuarios (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` CHAR(80) NOT NULL,
  `apellidos` CHAR(80) NOT NULL,
  `edad` INT NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  `contraseña` VARCHAR(200) NOT NULL,
  `telefono` VARCHAR(10) NULL DEFAULT NULL,
  `estado` CHAR(1) NOT NULL,
  `departamento` INT NULL DEFAULT NULL,
  `municipio` INT NULL DEFAULT NULL,
  `foto` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `usuarios_municipio_idx` (`municipio` ASC),
  INDEX `usuarios_departamento_idx` (`departamento` ASC),
  CONSTRAINT `usuarios_departamento`
    FOREIGN KEY (`departamento`)
    REFERENCES `departamento` (`iddepartamento`),
  CONSTRAINT `usuarios_municipio`
    FOREIGN KEY (`municipio`)
    REFERENCES `municipios` (`idmunicipio`))
;

CREATE TABLE IF NOT EXISTS anuncios (
  `idanuncio` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `titulo` CHAR(80) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  `descripcion` VARCHAR(1000) NOT NULL,
  `modalidad` CHAR(30) NOT NULL,
  `zona` CHAR(40) NOT NULL,
  `edificacion` VARCHAR(50) NOT NULL,
  `habitaciones` INT NOT NULL,
  `garaje` CHAR(2) NOT NULL,
  `precio` FLOAT NOT NULL,
  `fecha` CHAR(80) NOT NULL,
  `estado` CHAR(1) NOT NULL,
  `url1` VARCHAR(250) NOT NULL,
  `url2` VARCHAR(250) NOT NULL,
  `url3` VARCHAR(250) NOT NULL,
  `url4` VARCHAR(250) NOT NULL,
  `calificacion` TINYINT NULL DEFAULT NULL,
  `certificado` VARCHAR(500) NULL DEFAULT NULL,
  `ciudad` CHAR(50) NOT NULL,
  PRIMARY KEY (`idanuncio`),
  INDEX `usuarios_idx` (`idusuario` ASC),
  CONSTRAINT `anuncio - usuarios`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuarios` (`idusuario`))
;

CREATE TABLE IF NOT EXISTS `oferta` (
  `idoferta` INT NOT NULL,
  `idanuncio` INT NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idoferta`),
  INDEX `anuncios_idx` (`idanuncio` ASC),
  INDEX `usuarios_idx` (`idusuario` ASC),
  CONSTRAINT `anuncios`
    FOREIGN KEY (`idanuncio`)
    REFERENCES `anuncios` (`idanuncio`),
  CONSTRAINT `usuarios`
    FOREIGN KEY (`idusuario`)
    REFERENCES `usuarios` (`idusuario`))
;