class Indicadorporusuario < ActiveRecord::Base
  #Callbacks
  after_find :actualizar
  after_create :generar_primer_historial

  #Relationships
  belongs_to :indicador, :foreign_key => "idindicador"
  belongs_to :login, :class_name => "Login", :foreign_key => "idlogin"
  has_one :rol, through: :indicador
  has_many :historiales, :class_name => "Historialporindicador", :foreign_key => "idindicadorporusuario", dependent: :destroy

  #Public function used to test functionality
  def prueba
    #onemonthago = "> " + Time.now.to_date.to_s
    #self.historiales.count
    query
  end

  def email
    Login.find(self.idresponsable).email
  end

  def nombre
    Login.find(self.idresponsable).nombre
  end

  #Returns the actual value for the indicator
  def valoractual
    valor = self.connection().execute(query).first.first
    valor ? valor : 0
    #self.historiales.actual.valor
  end

  #Returns 1 for red, 2 for yellow, and 3 for green
  def valorsemaforo
    va = Float(valoractual)
    if va < Float(self.valorfinalrojo)
    1
    elsif va < Float(self.valorfinalamarillo)
    2
    else
    3
    end
  end

  #Returns standard deviation from the sample provided from all the historicals from indicator
  def varianza
    var = self.historiales.select("STDDEV_SAMP(valor) as desviacion").first.desviacion
    if var == nil
      var = 0.0
    end
    var
    #self.historiales.select("STDDEV_SAMP(valor) as desviacion, fecha").where("fecha BETWEEN ? AND ?",12.months.ago, 1.day.from_now)
    #"select STDDEV_SAMP(valor) from gestioncondominio.historialporindicadors"
  end

  #Public function used to generate new values, if necessary, to store on history of indicator
  def actualizar
    if toca_actualizar
      actualizar_privado
    end
  end


  #Private Functions
  private

    #Function that calculates how many times is necesary to calculate values, uses a loop, and in every iteration
    #it calculates a value corresponding, and saves it to the historial.
    def actualizar_privado
      diasUltimaAct = (Time.now.to_date - self.historiales.last.fecha).to_i
      acts = diasUltimaAct / 30
      fechaquery = ""
      resultado = 0.0
      acts.times do
        fechaquery = "BETWEEN '#{self.historiales.last.fecha}' AND '#{(self.historiales.last.fecha + 30.days)}'"
        resultado = self.connection().execute(query(fechaquery)).first.first # [[value]] -> value
        if resultado == nil
          resultado = 0.0
        end
        self.historiales.create(:fecha => (self.historiales.last.fecha + 30.days), :valor => resultado, :estatus => "A")
      end
    end

    #This method returns a boolean, true if its necesary to update, false if it is not.
    def toca_actualizar
      (Time.now.to_date - self.historiales.last.fecha).to_i >= 30
    end

  	def generar_primer_historial
      valor = self.connection().execute(query)
      self.historiales.create(:fecha => Time.now, :valor => valor.first.first, :estatus => "A")
  	end

    #This method returns the SQL query corresponding to the indicator.
    def query(fecha = "> " + (Time.now - 30.days).to_date.to_s)
      case self.indicador.idindicadores
      when 1..2
        minimizar_servicios_basicos(fecha)
      when 3..4
        minimizar_deuda_inmuebles_morosos(fecha)
      when 5..6
        maximizar_ingresos_alquiler_areas_comunes(fecha)
      when 7..8
        supervisar_saldo_fondo_trabajo
      when 9..10
        maximizar_multas_adjudicadas_inmuebles(fecha)
      when 11..12
        disminuir_numero_reclamos_y_sugerencias
      when 13..14
        supervision_fondo_reserva
      when 15
        minimizar_gastos_servicios_basicos_comunes(fecha)
      when 16
        disminuir_gastos_extraordinarios(fecha)
      when 17
        minimizar_cuota_condominio(fecha)
      when 18
        maximizar_condominios_asociados
      end
    end

  	# Querys que pertencen a Administrador y Junta de Condominio

  	def minimizar_servicios_basicos(fecha)
      "select sum(montodetalle) as monto from gestioncondominio.detalles inner join
        (select DISTINCT(proveedorxservicios.idproveedorxservicio) from 
        gestioncondominio.proveedorxservicios, 
        gestioncondominio.servicios, 
        gestioncondominio.proveedorxcondominios,
        gestioncondominio.comprobantedepagos
        where
        proveedorxcondominios.idproveedorxcondominio = 
        comprobantedepagos.idproveedorxcondominiocomprobantedepago
        and proveedorxcondominios.idproveedorxcondominio = 
        proveedorxservicios.idproveedorxcondominioproveedorxservicio
        and   servicios.idservicio = proveedorxservicios.idservicioproveedorxservicio
        and   proveedorxcondominios.idcondominioproveedorxcondominio = #{id_condominio}
        and (servicios.descripcionservicio='Agua'
        or servicios.descripcionservicio='Luz'
        or servicios.descripcionservicio='Gas'))
        as calculo2 on detalles.idproveedorxserviciodetalle =
        calculo2.idproveedorxservicio"
  	end

  	def minimizar_deuda_inmuebles_morosos(fecha)
  		"select sum(cuotapendienterecibo) as Deuda from gestioncondominio.recibocobros inner join
            (select * from gestioncondominio.inmuebles where idcondominioinmueble = #{id_condominio})
            as calculo on recibocobros.idinmueblerecibocobro = calculo.idinmueble and
            (estatuscancelacionrecibo = 'PENDIENTE' or estatuscancelacionrecibo = 'VENCIDO')
            and recibocobros.fecharecibocobro #{fecha}"
  	end

  	def maximizar_ingresos_alquiler_areas_comunes(fecha)
      "select sum(montopago) as Ganancia from gestioncondominio.pagos inner join(
            select idreservacion from gestioncondominio.reservacions) as c on
            pagos.idreservacionpago = c.idreservacion and idcondominio = #{id_condominio} and pagos.fechapago #{fecha}"
  	end

  	def supervisar_saldo_fondo_trabajo
      "select saldoactual as Saldo_Actual from gestioncondominio.fondos where idcondominiofondo=#{id_condominio} and idfondo=3"
  	end

  	def maximizar_multas_adjudicadas_inmuebles(fecha)
      "select count(*) as MultasAdjudicadas from gestioncondominio.multas inner join
            (select idinmueble from gestioncondominio.inmuebles where idcondominioinmueble = #{id_condominio}) as c1 on multas.idinmueblemulta = c1.idinmueble and multas.fechamulta #{fecha}"
  	end

  	def disminuir_numero_reclamos_y_sugerencias
  		"select count(*) from gestioncondominio.reclamosugerencias inner join 
            (select idinmueble from gestioncondominio.inmuebles where idcondominioinmueble=#{id_condominio}) as c1 on
            reclamosugerencias.idinmueblereclamosugerencia = c1.idinmueble"
  	end

    def supervision_fondo_reserva 
      "select saldoactual as Saldo_Actual from gestioncondominio.fondos where idcondominiofondo=#{id_condominio} and idfondo=2"
    end

  	# Querys de Copropietario

  	def minimizar_gastos_servicios_basicos_comunes(fecha)
  		minimizar_servicios_basicos(fecha)
  	end

  	def disminuir_gastos_extraordinarios(fecha)
  		"select sum(montoegresoxrecibo) as Gastos from gestioncondominio.egresoxrecibo inner join 
            (select idegresonocomunxinmueble from 
            gestioncondominio.egresonocomunxinmuebles,
            gestioncondominio.inmuebles,
            gestioncondominio.egresosnocomuns where
            inmuebles.idcondominioinmueble = #{id_condominio} and egresosnocomuns.fechanocomun #{fecha} and 
            inmuebles.idinmueble=egresonocomunxinmuebles.idinmueble and
            egresosnocomuns.idegresosnocomun=egresonocomunxinmuebles.idegresosnocomun) as c
            on egresoxrecibo.idegresonocomunxinmueble=c.idegresonocomunxinmueble"
  	end

  	def minimizar_cuota_condominio(fecha)
  		"select sum(montoegresoxrecibo) from gestioncondominio.egresoxrecibo inner join
            (select * from gestioncondominio.recibocobros inner join
            (select idinmueble from gestioncondominio.inmuebles where inmuebles.idinmueble='2' and idcondominioinmueble= #{id_condominio})
            as calculo on recibocobros.idinmueblerecibocobro=calculo.idinmueble and
            recibocobros.fecharecibocobro #{fecha}) as d on egresoxrecibo.idrecibocobro = d.idrecibocobro 
            and idegresonocomunxinmueble IS NULL"
  	end

  	# Querys de Superusuario

  	def maximizar_condominios_asociados
  		"select count(*) as CantidadCondominios from gestioncondominio.condominios"
  	end

    def id_condominio
      if self.login.inmueble
        self.login.inmueble.condominio.id
      else
        Empleado.find_by_idloginempleado(self.login.id).condominio.id
      end
    end
end
