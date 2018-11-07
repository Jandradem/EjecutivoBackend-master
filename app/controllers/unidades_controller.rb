class UnidadesController < ApplicationController
	before_action :set_unidad, only: [:show, :edit, :update, :destroy]

	#GET /unidades
	def index
		@unidades = Unidad.all
		render :json => @unidades
	end

	#GET /unidades/1
	def show
		render :json => @unidad
	end

	#POST /unidades
	def create
		@unidad = Unidad.new(unidad_params)
		if @unidad.save
		  render :json => @unidad
		else
		  render :json => @unidad.errors, status: :unprocessable_entity
		end
	end

	#PATCH/PUT /unidades/1
	def update
	  if @unidad.update(unidad_params)
	  	render :json => @unidad
	  else
	  	render json: @unidad.errors, status: :unprocessable_entity
	  end
	end

	#DELETE /unidades/1
	def destroy
		@unidad.destroy
		render :json => '{"estatus": "ok"}'
	end

  private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_unidad
	    @unidad = Unidad.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def unidad_params
	  	params.require(:unidad).permit!
	  end
end