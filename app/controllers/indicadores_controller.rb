class IndicadoresController < ApplicationController
	require "pony"
	before_filter :set_usuario
	before_action :set_indicador, only: [:show, :edit, :update, :destroy, :historial, :ultimos]

	#GET /indicadores
	def index
		render :json => @usuario.indicadores.where(:estatus => "A").to_json(:methods => [:valoractual, :valorsemaforo, :varianza, :nombre, :email])
	end

	#GET /indicadores/1
	def show
		render :json => @indicador.to_json(:methods => [:valoractual, :valorsemaforo, :varianza, :nombre, :email])
	end

	#GET /indicadores/1/historial
	def historial
		render :json => @indicador.historiales
	end

	#GET /indicadores/1/ultimos
	def ultimos
		render :json => @indicador.historiales.ultimos
	end

	#POST /indicadores
	def create
		#render :json => indicador_params
		indicador_params[:fechacreacion] = Time.now.to_date.to_s
		indicador_params[:estatus] = "A"
		@indicador = @usuario.indicadores.new(indicador_params)
		if @indicador.save
			asunto = '****SISTEMA DE GESTION DE CONDOMINIO**** Creacion de Indicador'
			texto = "
		  	Su Indicador ha sido Creado Satisfactoriamente!!


		  	
		  	Su valor actual es: #{@indicador.valoractual}
		  	------------------------------------------------------------------------
		  	
		  	Para mas informacion Llamar al 0500-SGC"
			send_email(set_email.first.first[1], asunto, texto)
		  render :json => {:success => true, :indicador => @indicador}
		else
		  render :json => {:success => false, :errors => @indicador.errors, status: :unprocessable_entity}
		end
	end

	#PATCH/PUT /indicadores/1
	def update
	  if @indicador.update(indicador_params)
	  	render :json => {:success => true, :indicador => @indicador}
	  else
	  	render :json => {:success => false, :errors => @indicador.errors, status: :unprocessable_entity}
	  end
	end

	#DELETE /indicadores/1
	def destroy
		@indicador.destroy
		render :json => {:success => true}
	end

  private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_indicador
	    @indicador = @usuario.indicadores.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def indicador_params
	  	params.require(:indicador).permit!
	  end

	  def set_usuario
	    @usuario = Login.find(params[:usuario_id])
	  end

	  def set_email
	  	case @usuario.rol.id 
	  	when 1 #Admin
	  		ActiveRecord::Base.connection.exec_query("SELECT correoempledo FROM empleados where idloginempleado = #{@usuario.idlogin}")
	  	when 2 #JuntaCondominio
	  		ActiveRecord::Base.connection.exec_query("SELECT correocopropietario FROM copropietarios WHERE idcopropietario=(SELECT idcopropietario FROM juntacondominios WHERE idloginjuntacondominio = #{@usuario.idlogin})")
	  	when 3 #Copropietario
	  		ActiveRecord::Base.connection.exec_query("SELECT correocopropietario FROM gestioncondominio.copropietarios WHERE idcopropietario = (SELECT idcopropietarioinmueble FROM inmuebles WHERE idlogininmueble = #{@usuario.idlogin})")
	  	end
	  end

	  def send_email(mail, asunto, texto)
	  	Pony.mail(:to => mail, :via => :smtp, :via_options => {
		  	:address => 'smtp.gmail.com',
		  	:port => '587',
		  	:user_name => 'sgcejecutivomovil', #usuario gmail
		  	:password => 'laboratorio3',            #password gmail
		  	:domain => "pop.gmail.com", # pop.gmail.com
		  	:authentication => :login
		  	},
		  	:subject => asunto,
		  	:body => texto)
	  end
end