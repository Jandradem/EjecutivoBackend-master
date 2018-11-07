SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `CondominioDreamTeamA-dev` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `CondominioDreamTeamA-dev` ;

-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Copropietarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Copropietarios` (
  `idCopropietario` VARCHAR(10) NOT NULL ,
  `nombreCop` VARCHAR(25) NOT NULL ,
  `apellidoCop` VARCHAR(25) NOT NULL ,
  `correoCop` VARCHAR(25) NOT NULL ,
  `telefonocop` VARCHAR(15) NOT NULL ,
  `fechaCreacion` DATE NOT NULL ,
  `estatusCop` VARCHAR(1) NOT NULL ,
  `direccionCop` VARCHAR(45) NOT NULL ,
  `fechaNacimientoEmpleado` DATE NOT NULL ,
  `fotoCop` BLOB NOT NULL ,
  `twitter` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`idCopropietario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`TipoCondominios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`TipoCondominios` (
  `idTipoCond` INT NOT NULL AUTO_INCREMENT ,
  `nombreTipoCond` VARCHAR(25) NOT NULL ,
  `estatusTipoCond` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idTipoCond`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Estados`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Estados` (
  `idEstado` INT NOT NULL AUTO_INCREMENT ,
  `nombreEstado` VARCHAR(25) NOT NULL ,
  `estatusEstado` VARCHAR(2) NOT NULL ,
  PRIMARY KEY (`idEstado`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Ciudades`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Ciudades` (
  `idCiudad` INT NOT NULL ,
  `nombreCiudad` VARCHAR(25) NOT NULL ,
  `idEstado` INT NOT NULL AUTO_INCREMENT ,
  `estatusCiudad` VARCHAR(2) NOT NULL ,
  PRIMARY KEY (`idCiudad`) ,
  INDEX `fk_Ciudad_Estado1_idx` (`idEstado` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Condominios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Condominios` (
  `idCondominio` VARCHAR(10) NOT NULL ,
  `rifCond` VARCHAR(10) NOT NULL ,
  `nombreCond` VARCHAR(25) NOT NULL ,
  `direccionCond` VARCHAR(25) NOT NULL ,
  `documentoCond` BLOB NOT NULL ,
  `estatusCond` VARCHAR(2) NOT NULL ,
  `idTipoCond` INT NOT NULL ,
  `idCiudad` INT NOT NULL ,
  `interesMora` FLOAT NOT NULL ,
  `tiempoMora` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idCondominio`) ,
  INDEX `fk_Condominio_Tipo_Condominio1_idx` (`idTipoCond` ASC) ,
  INDEX `fk_Condominio_Ciudad1_idx` (`idCiudad` ASC) ,
  CONSTRAINT `fk_Condominio_Tipo_Condominio1`
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`inmuebles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`inmuebles` (
  `idInmueble` VARCHAR(5) NOT NULL ,
  `metrosCuadrados` VARCHAR(25) NOT NULL ,
  `alicuota` FLOAT NOT NULL ,
  `descripcionIn` VARCHAR(25) NOT NULL ,
  `estatusInmueble` VARCHAR(2) NOT NULL ,
  `idCopropietario` VARCHAR(10) NOT NULL ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  `codigoDocumentoPropiedad` VARCHAR(20) NOT NULL ,
  `codigoCatastral` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idInmueble`) ,
  INDEX `fk_Inmueble_Copropietario_idx` (`idCopropietario` ASC) ,
  INDEX `fk_Inmueble_Condominio1_idx` (`idCondominio` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`ReclamoSugerencias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`ReclamoSugerencias` (
  `idReclamo` INT NOT NULL AUTO_INCREMENT ,
  `razon` VARCHAR(50) NOT NULL ,
  `fechaRec` DATE NOT NULL ,
  `descripcionRec` VARCHAR(150) NOT NULL ,
  `idInmueble` VARCHAR(5) NOT NULL ,
  `estatusReclamo` VARCHAR(2) NOT NULL ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`idReclamo`) ,
  INDEX `fk_Reclamo_Sugerencia_Inmueble1_idx` (`idInmueble` ASC) ,
  INDEX `fk_Reclamo_Sugerencia_Condominio1_idx` (`idCondominio` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Rols`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Rols` (
  `idRol` INT NOT NULL AUTO_INCREMENT ,
  `nombreRol` VARCHAR(25) NOT NULL ,
  `estatusRol` VARCHAR(25) NOT NULL ,
  PRIMARY KEY (`idRol`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`JuntaCondominios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`JuntaCondominios` (
  `idJunta` INT NOT NULL AUTO_INCREMENT ,
  `idCopropietario` VARCHAR(10) NOT NULL ,
  `fechaInicio` DATE NOT NULL ,
  `fechaCulminacion` DATE NOT NULL ,
  `estatusJ` VARCHAR(2) NOT NULL ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  `IdRol` INT NOT NULL ,
  `estatusJunta` VARCHAR(2) NOT NULL ,
  INDEX `fk_Junta_Condominio_Copropietario1_idx` (`idCopropietario` ASC) ,
  INDEX `fk_Junta_Condominio_Condominio1_idx` (`idCondominio` ASC) ,
  INDEX `fk_Junta_Condominio_Rol1_idx` (`IdRol` ASC) ,
  PRIMARY KEY (`idJunta`)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Logins`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Logins` (
  `idPersona` INT NOT NULL AUTO_INCREMENT ,
  `pasword` VARCHAR(10) NOT NULL ,
  `fechaRegistro` DATE NOT NULL ,
  `estatuslogin` VARCHAR(2) NOT NULL ,
  `idCopropietario` VARCHAR(10) NOT NULL ,
  `idRol` INT NOT NULL ,
  PRIMARY KEY (`idPersona`) ,
  INDEX `fk_Login_Copropietario1_idx` (`idCopropietario` ASC) ,
  INDEX `fk_Logins_Rols1_idx` (`idRol` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Formapagos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Formapagos` (
  `idFormaPago` INT NOT NULL AUTO_INCREMENT ,
  `descripcionForma` VARCHAR(25) NOT NULL ,
  PRIMARY KEY (`idFormaPago`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`ReciboCobroInmuebles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`ReciboCobroInmuebles` (
  `idReciboCobro` INT NOT NULL AUTO_INCREMENT ,
  `fechaRecibo` DATE NOT NULL ,
  `estatusCobro` VARCHAR(15) NOT NULL ,
  `montoIndividual` FLOAT NOT NULL ,
  `cuotaPendiente` FLOAT NOT NULL ,
  `fechaVencimiento` DATE NOT NULL ,
  `abono` FLOAT NOT NULL ,
  `idInmueble` VARCHAR(5) NOT NULL ,
  `estatusReciboCobroInmueble` VARCHAR(2) NOT NULL ,
  PRIMARY KEY (`idReciboCobro`) ,
  INDEX `fk_Recibo_Cobro_Inmueble_Inmueble1_idx` (`idInmueble` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Bancos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Bancos` (
  `idBanco` INT NOT NULL AUTO_INCREMENT ,
  `nombreBanco` VARCHAR(25) NOT NULL ,
  `rifBanco` VARCHAR(10) NOT NULL ,
  `estatusBanco` VARCHAR(2) NOT NULL ,
  PRIMARY KEY (`idBanco`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`HorarioAreas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`HorarioAreas` (
  `idHorarioArea` INT NOT NULL AUTO_INCREMENT ,
  `diaInicioApertura` VARCHAR(10) NOT NULL ,
  `diaFinalApertura` VARCHAR(10) NOT NULL ,
  `horaInicioApertura` VARCHAR(10) NOT NULL ,
  `horaFinalApertura` VARCHAR(10) NOT NULL ,
  `nombreArea` VARCHAR(45) NOT NULL ,
  `montoHora` FLOAT NOT NULL ,
  PRIMARY KEY (`idHorarioArea`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`AreaComunes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`AreaComunes` (
  `idAreaComun` INT NOT NULL ,
  `descripcionArea` VARCHAR(50) NOT NULL ,
  `estatusArea` VARCHAR(2) NOT NULL ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  `idHorarioArea` INT NOT NULL ,
  `capacidadArea` INT NOT NULL ,
  PRIMARY KEY (`idAreaComun`) ,
  INDEX `fk_Area_Comun_Condominio1_idx` (`idCondominio` ASC) ,
  INDEX `fk_Area_Comun_Horario_Area1_idx` (`idHorarioArea` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Reservaciones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Reservaciones` (
  `idReservacion` INT NOT NULL AUTO_INCREMENT ,
  `fechaInicioReserva` DATE NOT NULL ,
  `fechaFinalReservacion` DATE NOT NULL ,
  `listaInvitados` BLOB NOT NULL ,
  `idAreaComun` INT NOT NULL ,
  `idInmueble` VARCHAR(5) NOT NULL ,
  `estatusReserva` VARCHAR(2) NOT NULL ,
  `descripcionPago` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idReservacion`) ,
  INDEX `fk_Reservacion_Area_Comun1_idx` (`idAreaComun` ASC) ,
  INDEX `fk_Reservacion_Inmueble1_idx` (`idInmueble` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Pagos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Pagos` (
  `idPago` INT NOT NULL AUTO_INCREMENT ,
  `fechaPago` DATE NOT NULL ,
  `nroDocumento` VARCHAR(20) NOT NULL ,
  `montoPago` FLOAT NOT NULL ,
  `horapago` TIME NOT NULL ,
  `idFormaPago` INT NOT NULL ,
  `idReciboCobro` INT NOT NULL ,
  `idBanco` INT NOT NULL ,
  `estatusPago` VARCHAR(2) NOT NULL ,
  `IdReservacion` INT NOT NULL ,
  PRIMARY KEY (`idPago`) ,
  INDEX `fk_Pago_Forma_pago1_idx` (`idFormaPago` ASC) ,
  INDEX `fk_Pago_Recibo_Cobro_Inmueble1_idx` (`idReciboCobro` ASC) ,
  INDEX `fk_Pago_Banco1_idx` (`idBanco` ASC) ,
  INDEX `fk_Pago_Reservacion1_idx` (`IdReservacion` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`TipoEgresos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`TipoEgresos` (
  `idTipoEgresos` INT NOT NULL AUTO_INCREMENT ,
  `nombreTipoEgre` VARCHAR(45) NOT NULL ,
  `estatusTipoegr` VARCHAR(2) NOT NULL ,
  PRIMARY KEY (`idTipoEgresos`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Egresos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Egresos` (
  `idEgreso` INT NOT NULL AUTO_INCREMENT ,
  `montoE` FLOAT NOT NULL ,
  `descripcionEgreso` VARCHAR(25) NOT NULL ,
  `nroReciboProveedor` VARCHAR(5) NOT NULL ,
  `fechaEgreso` DATE NOT NULL ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  `estatusEgreso` VARCHAR(2) NOT NULL ,
  `idTipoEgresos` INT NOT NULL ,
  PRIMARY KEY (`idEgreso`) ,
  INDEX `fk_Egreso_Condominio1_idx` (`idCondominio` ASC) ,
  INDEX `fk_Egreso_TipoEgresos1_idx` (`idTipoEgresos` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`TipoMultasMaestros`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`TipoMultasMaestros` (
  `idTipoMultas` INT NOT NULL AUTO_INCREMENT ,
  `NombreMulta` VARCHAR(45) NOT NULL ,
  `MontoMultas` FLOAT NOT NULL ,
  PRIMARY KEY (`idTipoMultas`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Multas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Multas` (
  `idMultas` INT NOT NULL AUTO_INCREMENT ,
  `DescripcionMulltas` VARCHAR(45) NOT NULL ,
  `montoMulta` FLOAT NOT NULL ,
  `fechaMulta` DATE NOT NULL ,
  `idInmueble` VARCHAR(5) NOT NULL ,
  `idTipoMultas` INT NOT NULL ,
  PRIMARY KEY (`idMultas`) ,
  INDEX `fk_Multas_Inmueble1_idx` (`idInmueble` ASC) ,
  INDEX `fk_Multas_TipoMultasMaestros1_idx` (`idTipoMultas` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`EgresoXReciboCobroXInmuebles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`EgresoXReciboCobroXInmuebles` (
  `idEgreso` INT NOT NULL ,
  `idReciboCobro` INT NOT NULL ,
  `descripcionDetalle` VARCHAR(25) NOT NULL ,
  `montoDetalle` FLOAT NOT NULL ,
  `EstatusReciboInmueble` VARCHAR(2) NOT NULL ,
  `idMultas` INT NOT NULL ,
  PRIMARY KEY (`idEgreso`, `idReciboCobro`) ,
  INDEX `fk_Egreso_has_Recibo_Cobro_Inmueble_Recibo_Cobro_Inmueble1_idx` (`idReciboCobro` ASC) ,
  INDEX `fk_Egreso_has_Recibo_Cobro_Inmueble_Egreso1_idx` (`idEgreso` ASC) ,
  INDEX `fk_Egreso_has_Recibo_Cobro_Inmueble_Multas1_idx` (`idMultas` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`EgresosNoComunes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`EgresosNoComunes` (
  `idEgresosNoComunes` INT NOT NULL AUTO_INCREMENT ,
  `descripcionNoComunes` VARCHAR(25) NOT NULL ,
  `montoNoComunes` FLOAT NOT NULL ,
  `fechaNoComun` DATE NOT NULL ,
  `idEgreso` INT NOT NULL ,
  `idReciboCobro` INT NOT NULL ,
  `estatusEgresoNoComun` VARCHAR(2) NOT NULL ,
  `idInmueble` VARCHAR(5) NOT NULL ,
  PRIMARY KEY (`idEgresosNoComunes`) ,
  INDEX `fk_Egresos_No_Comunes_Egreso_has_Recibo_Cobro_Inmueble1_idx` (`idEgreso` ASC, `idReciboCobro` ASC) ,
  INDEX `fk_Egresos_No_Comunes_Inmueble1_idx` (`idInmueble` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`TipoIngresos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`TipoIngresos` (
  `idTipoIngresos` INT NOT NULL AUTO_INCREMENT ,
  `nombreTipoIngresos` VARCHAR(45) NOT NULL ,
  `estatusTipoIng` VARCHAR(2) NOT NULL ,
  PRIMARY KEY (`idTipoIngresos`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Ingresos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Ingresos` (
  `idIngresos` INT NOT NULL ,
  `montoIngresos` FLOAT NOT NULL ,
  `descripcionIngresos` VARCHAR(25) NOT NULL ,
  `fechaIngreso` FLOAT NOT NULL ,
  `tipoingreso` VARCHAR(15) NOT NULL ,
  `idPago` INT NOT NULL ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  `idTipoIngresos` INT NOT NULL ,
  PRIMARY KEY (`idIngresos`) ,
  INDEX `fk_Ingresos_Pago1_idx` (`idPago` ASC) ,
  INDEX `fk_Ingresos_Condominio1_idx` (`idCondominio` ASC) ,
  INDEX `fk_Ingresos_TipoIngresos1_idx` (`idTipoIngresos` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`TipoEmpleados`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`TipoEmpleados` (
  `idTipoEmpleado` INT NOT NULL AUTO_INCREMENT ,
  `nombreTipoEmp` VARCHAR(25) NOT NULL ,
  PRIMARY KEY (`idTipoEmpleado`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Horarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Horarios` (
  `idHorario` INT NOT NULL AUTO_INCREMENT ,
  `fechaHorario` DATE NOT NULL ,
  `horaInicio` VARCHAR(5) NOT NULL ,
  `horaFin` VARCHAR(5) NOT NULL ,
  PRIMARY KEY (`idHorario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Empleados`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Empleados` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT ,
  `nombreEmp` VARCHAR(25) NOT NULL ,
  `apellidoEmp` VARCHAR(25) NOT NULL ,
  `direccionEmp` VARCHAR(50) NOT NULL ,
  `telefonoEmp` VARCHAR(15) NOT NULL ,
  `correoEmp` VARCHAR(25) NOT NULL ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  `idTipoEmpleado` INT NOT NULL ,
  `estatusEmpleado` VARCHAR(2) NOT NULL ,
  `idHorario` INT NOT NULL ,
  `fechaNacimientoEmpleado` DATE NOT NULL ,
  `fotoEmpleado` BLOB NOT NULL ,
  `sueldoBase` FLOAT NOT NULL ,
  PRIMARY KEY (`idEmpleado`) ,
  INDEX `fk_Empleado_Condominio1_idx` (`idCondominio` ASC) ,
  INDEX `fk_Empleado_Tipo_Empleado1_idx` (`idTipoEmpleado` ASC) ,
  INDEX `fk_Empleado_Horario1_idx` (`idHorario` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`NominaEmpleados`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`NominaEmpleados` (
  `idNominaEmpleados` INT NOT NULL AUTO_INCREMENT ,
  `sueldo` FLOAT NOT NULL ,
  `compensacion` FLOAT NOT NULL ,
  `nominaEmpleadoscol` VARCHAR(45) NULL ,
  `idEmpleado` INT NOT NULL ,
  `idEgreso` INT NOT NULL ,
  `SueldoNeto` FLOAT NOT NULL ,
  PRIMARY KEY (`idNominaEmpleados`) ,
  INDEX `fk_Nomina_Empleados_Empleado1_idx` (`idEmpleado` ASC) ,
  INDEX `fk_Nomina_Empleados_Egreso1_idx` (`idEgreso` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Visitantes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Visitantes` (
  `idVisitantes` INT NOT NULL AUTO_INCREMENT ,
  `cedula` VARCHAR(12) NOT NULL ,
  `nombreV` VARCHAR(25) NOT NULL ,
  `apellidoV` VARCHAR(25) NOT NULL ,
  `Estatus_V` VARCHAR(2) NULL ,
  PRIMARY KEY (`idVisitantes`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`ControlVisitas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`ControlVisitas` (
  `idControlVisitas` INT NOT NULL AUTO_INCREMENT ,
  `idVisitantes` INT NOT NULL ,
  `idEmpleado` INT NOT NULL ,
  `idInmueble` VARCHAR(5) NOT NULL ,
  `fechaVisita` DATE NOT NULL ,
  `horaVisita` VARCHAR(12) NOT NULL ,
  PRIMARY KEY (`idControlVisitas`) ,
  INDEX `fk_Control_Visitas_Visitantes1_idx` (`idVisitantes` ASC) ,
  INDEX `fk_Control_Visitas_Empleado1_idx` (`idEmpleado` ASC) ,
  INDEX `fk_Control_Visitas_Inmueble1_idx` (`idInmueble` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`BancoXCondominios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`BancoXCondominios` (
  `idBanco` INT NOT NULL ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  `nroCuenta` VARCHAR(20) NOT NULL ,
  `cedTitularCuenta` VARCHAR(10) NOT NULL ,
  `nombreTitular` VARCHAR(25) NOT NULL ,
  `tipoCuenta` VARCHAR(10) NOT NULL ,
  `descripcionBanco` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`idBanco`, `idCondominio`) ,
  INDEX `fk_Banco_has_Condominio_Condominio1_idx` (`idCondominio` ASC) ,
  INDEX `fk_Banco_has_Condominio_Banco1_idx` (`idBanco` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Proveedores`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Proveedores` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT ,
  `cedula` VARCHAR(12) NOT NULL ,
  `nombreProveedor` VARCHAR(25) NOT NULL ,
  `correoproveedor` VARCHAR(15) NOT NULL ,
  `telefonoProveedor` VARCHAR(45) NOT NULL ,
  `estatusProveesor` VARCHAR(2) NOT NULL ,
  `rifProveedor` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`idProveedor`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`ProveedorXCondominios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`ProveedorXCondominios` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`idProveedor`, `idCondominio`) ,
  INDEX `fk_Proveedor_has_Condominio_Condominio1_idx` (`idCondominio` ASC) ,
  INDEX `fk_Proveedor_has_Condominio_Proveedor1_idx` (`idProveedor` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Servicios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Servicios` (
  `idServicios` INT NOT NULL AUTO_INCREMENT ,
  `descripcionServicios` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idServicios`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`FacturaProveedores`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`FacturaProveedores` (
  `idServicios` INT NOT NULL ,
  `idProveedor` INT NOT NULL ,
  `fechaServicio` DATE NOT NULL ,
  `montoServicio` FLOAT NOT NULL ,
  `descripcionServicio` VARCHAR(50) NOT NULL ,
  `fechaVencimientoServicio` VARCHAR(45) NOT NULL ,
  `NroReciboProveedorServicio` VARCHAR(5) NOT NULL ,
  `Cantidad` INT NOT NULL ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  `idEgreso` INT NOT NULL ,
  PRIMARY KEY (`NroReciboProveedorServicio`) ,
  INDEX `fk_Servicios_has_Proveedor_Condominio1_idx` (`idCondominio` ASC) ,
  INDEX `fk_Servicios_has_Proveedor_Egreso1_idx` (`idEgreso` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Cotizacion_Proveedores`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Cotizacion_Proveedores` (
  `idCotizacionProveedor` INT NOT NULL AUTO_INCREMENT ,
  `cotizacionProveedorcol` VARCHAR(45) NOT NULL ,
  `montoCotizacion` FLOAT NOT NULL ,
  `fechaCotizacion` DATE NOT NULL ,
  `cotizador` VARCHAR(25) NOT NULL ,
  `fechaVencimientoCotizacion` VARCHAR(45) NOT NULL ,
  `nroReciboProveedorServicio` VARCHAR(5) NOT NULL ,
  `EstatusCotizacion` VARCHAR(2) NOT NULL ,
  `aprobacion` TINYINT(1) NULL ,
  PRIMARY KEY (`idCotizacionProveedor`) ,
  INDEX `fk_Cotizacion_Proveedor_FacturaProveedor1_idx` (`nroReciboProveedorServicio` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`TiponoticiaMaestros`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`TiponoticiaMaestros` (
  `idTiponoticia` INT NOT NULL AUTO_INCREMENT ,
  `nombreNoticias` VARCHAR(45) NOT NULL ,
  `estatusTiponoticiaMaestroscol` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idTiponoticia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Noticias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Noticias` (
  `idNoticia` INT NOT NULL AUTO_INCREMENT ,
  `fechaNoticia` DATE NOT NULL ,
  `tipoNoticia` VARCHAR(20) NOT NULL ,
  `minuta` BLOB NOT NULL ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  `estatusNoticia` VARCHAR(45) NOT NULL ,
  `descripcionNoticia` VARCHAR(150) NOT NULL ,
  `idTiponoticia` INT NOT NULL ,
  PRIMARY KEY (`idNoticia`) ,
  INDEX `fk_Noticia_Condominio1_idx` (`idCondominio` ASC) ,
  INDEX `fk_Noticia_TiponoticiaMaestros1_idx` (`idTiponoticia` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`FondoReservas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`FondoReservas` (
  `idFondoReserva` INT NOT NULL AUTO_INCREMENT ,
  `nombreFondo` VARCHAR(45) NOT NULL ,
  `objetivo` VARCHAR(45) NOT NULL ,
  `saldoActual` FLOAT NOT NULL ,
  `cuentas` FLOAT NOT NULL ,
  `estatusFondo` VARCHAR(2) NOT NULL ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`idFondoReserva`) ,
  INDEX `fk_FondoReserva_Condominio1_idx` (`idCondominio` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Municipios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Municipios` (
  `idMunicipio` INT NOT NULL AUTO_INCREMENT ,
  `idEstado` INT NOT NULL ,
  `idCiudad` INT NOT NULL ,
  `nombreMunicipio` VARCHAR(30) NOT NULL ,
  PRIMARY KEY (`idMunicipio`) ,
  INDEX `fk_Municipio_Estado1_idx` (`idEstado` ASC) ,
  INDEX `fk_Municipio_Ciudad1_idx` (`idCiudad` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`ProveedorXServicios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`ProveedorXServicios` (
  `idProveedor` INT NOT NULL ,
  `idServicios` INT NOT NULL ,
  PRIMARY KEY (`idProveedor`, `idServicios`) ,
  INDEX `fk_Proveedor_has_Servicios_Servicios1_idx` (`idServicios` ASC) ,
  INDEX `fk_Proveedor_has_Servicios_Proveedor1_idx` (`idProveedor` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`DetalleProveedorServicios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`DetalleProveedorServicios` (
  `idProveedor` INT NOT NULL ,
  `IdServicios` INT NOT NULL ,
  `NroReciboProveedorServicio` VARCHAR(5) NOT NULL ,
  PRIMARY KEY (`idProveedor`, `IdServicios`, `NroReciboProveedorServicio`) ,
  INDEX `fk_Proveedor_has_Servicios_has_FacturaProveedor_FacturaProv_idx` (`NroReciboProveedorServicio` ASC) ,
  INDEX `fk_Proveedor_has_Servicios_has_FacturaProveedor_Proveedor_h_idx` (`idProveedor` ASC, `IdServicios` ASC)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Indicadores`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Indicadores` (
  `idIndicadores` INT NOT NULL AUTO_INCREMENT ,
  `nombreIndicadores` VARCHAR(25) NOT NULL ,
  `estatusIndicadores` VARCHAR(2) NOT NULL ,
  PRIMARY KEY (`idIndicadores`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`Unidades`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`Unidades` (
  `idUnidades` INT NOT NULL AUTO_INCREMENT ,
  `nombreUnidades` VARCHAR(45) NULL ,
  `estatusUnidades` VARCHAR(2) NOT NULL ,
  PRIMARY KEY (`idUnidades`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`FrecuenciaNotificaciones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`FrecuenciaNotificaciones` (
  `idFrecuencia` INT NOT NULL AUTO_INCREMENT ,
  `nombreFrecuencia` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idFrecuencia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CondominioDreamTeamA-dev`.`UsuarioPorIndicadores`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `CondominioDreamTeamA-dev`.`UsuarioPorIndicadores` (
  `idUsuarioPorIndicador` INT NOT NULL AUTO_INCREMENT ,
  `idIndicadores` INT NOT NULL ,
  `idUnidades` INT NOT NULL ,
  `idFrecuencia` INT NOT NULL ,
  `idRol` INT NOT NULL ,
  `idCondominio` VARCHAR(10) NOT NULL ,
  `valorDeMeta` VARCHAR(45) NOT NULL ,
  `fechaMeta` VARCHAR(45) NOT NULL ,
  `valorAmarillo` VARCHAR(45) NOT NULL ,
  `valorRojo` VARCHAR(45) NOT NULL ,
  `valorVerde` VARCHAR(45) NOT NULL ,
  `fechaAmarillo` VARCHAR(45) NOT NULL ,
  `fechaRojo` VARCHAR(45) NOT NULL ,
  `fechaVerde` VARCHAR(45) NOT NULL ,
  `correoResponsableMeta` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idUsuarioPorIndicador`) ,
  INDEX `fk_UsuarioPorIndicador_Indicadores1_idx` (`idIndicadores` ASC) ,
  INDEX `fk_UsuarioPorIndicador_Unidades1_idx` (`idUnidades` ASC) ,
  INDEX `fk_UsuarioPorIndicador_FrecuenciaNotificaciones1_idx` (`idFrecuencia` ASC) ,
  INDEX `fk_UsuarioPorIndicador_Rol1_idx` (`idRol` ASC) ,
  INDEX `fk_UsuarioPorIndicador_Condominio1_idx` (`idCondominio` ASC)
ENGINE = InnoDB;

USE `CondominioDreamTeamA-dev` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
