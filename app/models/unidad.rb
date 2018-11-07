class Unidad < ActiveRecord::Base
	self.table_name = "unidades"
	has_many :indicadores, :class_name => "Indicador"
end
