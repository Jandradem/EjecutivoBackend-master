class Condominio < ActiveRecord::Base
	has_many :inmuebles, :class_name => "Inmueble", :foreign_key => "idcondominioinmueble"
end
