class UsuariosController < ApplicationController
	before_action :set_usuario, only: [:show, :edit, :update, :destroy, :catalogo]

	#GET /usuario
	def index
		@usuarios = Login.all
		render :json => @usuarios.to_json(:only => [ :idlogin, :idrollogin, :age ],:methods => [:nombre, :foto_url, :rolname, :rolynombre, :email])
	end

	#GET /usuario/1
	def show
		@login = Login.select(:idlogin, :idrollogin, :usuariologin).where(params[:id]).first
		render :json => @login.to_json(:methods => [:nombre])
		
	end

	#GET /usuarios/1/catalogo
	def catalogo
		render :json => @usuario.rol.indicadores
	end

	#POST /usuario
	def create
		@usuario = Login.new(usuario_params)
		if @usuario.save
		  render :json => @usuario
		else
		  render :json => @usuario.errors, status: :unprocessable_entity
		end
	end

	#PATCH/PUT /usuario/1
	def update
	  if @usuario.update(usuario_params)
	  	render :json => @usuario
	  else
	  	render json: @usuario.errors, status: :unprocessable_entity
	  end
	end

	#DELETE /usuario/1
	def destroy
		@usuario.destroy
		render :json => '{"estatus": "ok"}'
	end

  private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_usuario
	    @usuario = Login.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def usuario_params
	  	params.require(:login).permit!
	  end
end