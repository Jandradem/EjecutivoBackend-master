class Login < ActiveRecord::Base
  belongs_to :rol, :class_name => "Rol", :foreign_key => "idrollogin"
  has_many :indicadores, :class_name => "Indicadorporusuario", :foreign_key => "idlogin"
  has_one :inmueble, :foreign_key => "idlogininmueble", :primary_key => "idlogin"

  def nombre
  	case self.idrollogin
  	when 1 
  		empleado = Empleado.find_by_idloginempleado(self.id)
      "#{empleado.nombreempledo} #{empleado.apellidoempledo}"
  	when 2
  		#junta = Juntacondominio.find_by_idloginjuntacondominio(self.id)
  		resp = self.connection().execute("SELECT nombrecopropietario,apellidocopropietario FROM gestioncondominio.copropietarios where idcopropietario = (SELECT idcopropietario FROM gestioncondominio.juntacondominios where idloginjuntacondominio = #{self.id})")
  		"#{resp.first.first} #{resp.first.second}"

  	when 3
  		resp = self.connection().execute("SELECT nombrecopropietario,apellidocopropietario FROM gestioncondominio.copropietarios where idcopropietario = #{self.inmueble.idcopropietarioinmueble}")
  		"#{resp.first.first} #{resp.first.second}"
  	when 4
  		"Superusuario"
  	end
  end

  def rolynombre
    "[#{rolname[0..4]}] #{nombre}"
  end

  def email
    case self.rol.id 
    when 1 #Admin
      self.connection().execute("SELECT correoempledo FROM empleados where idloginempleado = #{self.idlogin}").first.first
    when 2 #JuntaCondominio
      self.connection().execute("SELECT correocopropietario FROM copropietarios WHERE idcopropietario=(SELECT idcopropietario FROM juntacondominios WHERE idloginjuntacondominio = #{self.idlogin})").first.first
    when 3 #Copropietario
      self.connection().execute("SELECT correocopropietario FROM gestioncondominio.copropietarios WHERE idcopropietario = (SELECT idcopropietarioinmueble FROM inmuebles WHERE idlogininmueble = #{self.idlogin})").first.first
    end
  end

  def rolname
    Rol.find(self.idrollogin).nombrerol
  end

  def foto_url
  	case self.idrollogin
  	when 1
  		Empleado.find_by_idloginempleado(self.id).nombrefotoempleado
    when 2
      self.connection().execute("SELECT nombrefotocopropietario FROM gestioncondominio.copropietarios where idcopropietario = (SELECT idcopropietario FROM gestioncondominio.juntacondominios where idloginjuntacondominio = #{self.id})").first.first
    when 3
        self.connection().execute("SELECT nombrefotocopropietario FROM gestioncondominio.copropietarios where idcopropietario = #{self.inmueble.idcopropietarioinmueble}").first.first
    when 4
      ""
    when 5
      Empleado.find_by_idloginempleado(self.id).nombrefotoempleado
  	end
  end
end
