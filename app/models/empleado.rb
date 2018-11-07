class Empleado < ActiveRecord::Base
	belongs_to :condominio, :foreign_key => "idcondominioempleado"
end
