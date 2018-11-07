class Indicador < ActiveRecord::Base
	self.table_name = "indicadores"
  belongs_to :rol, :foreign_key => "idrol"
  belongs_to :unidad
  has_many :indicadores, :class_name => "Indicadorporusuario", :foreign_key => "idindicador"
end
