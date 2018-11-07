class Inmueble < ActiveRecord::Base
	belongs_to :login, :foreign_key => "idlogininmueble", :primary_key => "idlogin"
	belongs_to :condominio, :foreign_key => "idcondominioinmueble"
end