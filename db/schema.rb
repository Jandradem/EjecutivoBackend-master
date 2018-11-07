# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

# Could not dump table "AreaComunes" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3041040a38>

# Could not dump table "BancoXCondominios" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f304100e998>

  create_table "Bancos", primary_key: "idBanco", force: true do |t|
    t.string "nombreBanco",  limit: 25, null: false
    t.string "rifBanco",     limit: 10, null: false
    t.string "estatusBanco", limit: 2,  null: false
  end

# Could not dump table "Ciudades" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040fc6f08>

# Could not dump table "Condominios" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040fa0ec0>

# Could not dump table "ControlVisitas" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040f734e8>

  create_table "Copropietarios", primary_key: "idCopropietario", force: true do |t|
    t.string "nombreCop",               limit: 25, null: false
    t.string "apellidoCop",             limit: 25, null: false
    t.string "correoCop",               limit: 25, null: false
    t.string "telefonocop",             limit: 15, null: false
    t.date   "fechaCreacion",                      null: false
    t.string "estatusCop",              limit: 1,  null: false
    t.string "direccionCop",            limit: 45, null: false
    t.date   "fechaNacimientoEmpleado",            null: false
    t.binary "fotoCop",                            null: false
    t.string "twitter",                 limit: 50, null: false
  end

# Could not dump table "Cotizacion_Proveedores" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040eec060>

# Could not dump table "DetalleProveedorServicios" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040eb60a0>

# Could not dump table "EgresoXReciboCobroXInmuebles" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040e8f810>

# Could not dump table "Egresos" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040e6c3b0>

# Could not dump table "EgresosNoComunes" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040e34938>

# Could not dump table "Empleados" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040ddfb68>

  create_table "Estados", primary_key: "idEstado", force: true do |t|
    t.string "nombreEstado",  limit: 25, null: false
    t.string "estatusEstado", limit: 2,  null: false
  end

# Could not dump table "FacturaProveedores" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040d669e8>

# Could not dump table "FondoReservas" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040d413c8>

  create_table "Formapagos", primary_key: "idFormaPago", force: true do |t|
    t.string "descripcionForma", limit: 25, null: false
  end

  create_table "FrecuenciaNotificaciones", primary_key: "idFrecuencia", force: true do |t|
    t.string "nombreFrecuencia", limit: 45, null: false
  end

  create_table "HorarioAreas", primary_key: "idHorarioArea", force: true do |t|
    t.string "diaInicioApertura",  limit: 10, null: false
    t.string "diaFinalApertura",   limit: 10, null: false
    t.string "horaInicioApertura", limit: 10, null: false
    t.string "horaFinalApertura",  limit: 10, null: false
    t.string "nombreArea",         limit: 45, null: false
    t.float  "montoHora",                     null: false
  end

  create_table "Horarios", primary_key: "idHorario", force: true do |t|
    t.date   "fechaHorario",           null: false
    t.string "horaInicio",   limit: 5, null: false
    t.string "horaFin",      limit: 5, null: false
  end

  create_table "Indicadores", primary_key: "idIndicadores", force: true do |t|
    t.string "nombreIndicadores",  limit: 25, null: false
    t.string "estatusIndicadores", limit: 2,  null: false
  end

# Could not dump table "Ingresos" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040c3e070>

# Could not dump table "JuntaCondominios" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f30405abc80>

# Could not dump table "Logins" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040534338>

# Could not dump table "Multas" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f30404a67e0>

# Could not dump table "Municipios" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f304043a6f8>

# Could not dump table "NominaEmpleados" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f30403c8788>

# Could not dump table "Noticias" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f304032fc18>

# Could not dump table "Pagos" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f30402f0568>

# Could not dump table "ProveedorXCondominios" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f30402c93a0>

# Could not dump table "ProveedorXServicios" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3040266840>

  create_table "Proveedores", primary_key: "idProveedor", force: true do |t|
    t.string "cedula",            limit: 12, null: false
    t.string "nombreProveedor",   limit: 25, null: false
    t.string "correoproveedor",   limit: 15, null: false
    t.string "telefonoProveedor", limit: 45, null: false
    t.string "estatusProveesor",  limit: 2,  null: false
    t.string "rifProveedor",      limit: 10, null: false
  end

# Could not dump table "ReciboCobroInmuebles" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f30401c2da8>

# Could not dump table "ReclamoSugerencias" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f304016d880>

# Could not dump table "Reservaciones" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f30400ff240>

  create_table "Rols", primary_key: "idRol", force: true do |t|
    t.string "nombreRol",  limit: 25, null: false
    t.string "estatusRol", limit: 25, null: false
  end

  create_table "Servicios", primary_key: "idServicios", force: true do |t|
    t.string "descripcionServicios", limit: 45, null: false
  end

  create_table "TipoCondominios", primary_key: "idTipoCond", force: true do |t|
    t.string "nombreTipoCond",  limit: 25, null: false
    t.string "estatusTipoCond", limit: 45, null: false
  end

  create_table "TipoEgresos", primary_key: "idTipoEgresos", force: true do |t|
    t.string "nombreTipoEgre", limit: 45, null: false
    t.string "estatusTipoegr", limit: 2,  null: false
  end

  create_table "TipoEmpleados", primary_key: "idTipoEmpleado", force: true do |t|
    t.string "nombreTipoEmp", limit: 25, null: false
  end

  create_table "TipoIngresos", primary_key: "idTipoIngresos", force: true do |t|
    t.string "nombreTipoIngresos", limit: 45, null: false
    t.string "estatusTipoIng",     limit: 2,  null: false
  end

  create_table "TipoMultasMaestros", primary_key: "idTipoMultas", force: true do |t|
    t.string "NombreMulta", limit: 45, null: false
    t.float  "MontoMultas",            null: false
  end

  create_table "TiponoticiaMaestros", primary_key: "idTiponoticia", force: true do |t|
    t.string "nombreNoticias",                limit: 45, null: false
    t.string "estatusTiponoticiaMaestroscol", limit: 45, null: false
  end

  create_table "Unidades", primary_key: "idUnidades", force: true do |t|
    t.string "nombreUnidades",  limit: 45
    t.string "estatusUnidades", limit: 2,  null: false
  end

# Could not dump table "UsuarioPorIndicadores" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f303f3ff0b8>

  create_table "Visitantes", primary_key: "idVisitantes", force: true do |t|
    t.string "cedula",    limit: 12, null: false
    t.string "nombreV",   limit: 25, null: false
    t.string "apellidoV", limit: 25, null: false
    t.string "Estatus_V", limit: 2
  end

# Could not dump table "inmuebles" because of following NoMethodError
#   undefined method `orders' for #<ActiveRecord::ConnectionAdapters::Mysql2IndexDefinition:0x007f3041520be8>

end
