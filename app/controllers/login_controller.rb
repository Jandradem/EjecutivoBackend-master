class LoginController < ApplicationController
	before_action :set_indicador, only: [:show, :edit, :update, :destroy]

	#GET /logins
	def index
		@logins = Login.all
		render :json => @logins
	end

	#GET /logins/1
	def show
		render :json => @login
	end

	#POST /logins
	def create
		#Usa el metodo Post de HTTP para recibir los parámetros de inicio de sesión.
		#Los parámetros deben ser enviados con claves valor de la siguiente manera en la petición AJAX/AJAJ
		#params: {
		#    'login[usuariologin]': username,
		#    'login[passwordlogin]': password
		#}
		#esto debido al filtro params.require(:login) aplicado, de esta manera no se aceptan parametros extraños.
		@login = Login.select(:idlogin, :idrollogin).where(login_params).first
		if @login
			#Used JSON.parse because the JSON was render as scaped chars.
			render :json => {:success => true, :user => @login.to_json(:methods => [:nombre, :foto_url])}
		else
			render :json => {:success=> false}
		end
	end

	#DELETE /logins/1
	def destroy
		@login.destroy
		render :json => '{"estatus": "ok"}'
	end

  private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_indicador
	    @login = Login.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def login_params
	  	params.require(:login).permit!
	  end
end