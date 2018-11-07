class Historialporindicador < ActiveRecord::Base
	#Relationships
  belongs_to :indicador, :class_name => "Indicadorporusuario", :foreign_key => "idindicadorporusuario"

  #Scopes
  scope :ultimos, -> { self.all.order("fecha asc").limit(12) }
  scope :actual, -> { self.all.order("fecha asc").last }
end
