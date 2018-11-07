class Rol < ActiveRecord::Base
	has_many :logins, :class_name => "Login", :foreign_key => "idrollogin"
	has_many :indicadores, :class_name => "Indicador", :foreign_key => "idrol"
end
