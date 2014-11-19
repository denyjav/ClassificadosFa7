class ComentariosController < ApplicationController

	def create
	
		@anuncio = Anuncio.find(params[:anuncio_id])
		@comentario = @anuncio.comentarios.build(comentario_params)
		
		#if success = @comentario.save
		#	UserMailer.new_comentario(@anuncio, @comentario).deliver
		#end
		if success = @comentario.save
			UserMailer.new_comentario(@anuncio, @comentario).deliver
		end

		respond_to do |format|
			format.html do
				#if success
				#@comentario.save
				if success
      				flash[:notice] = "Comentario foi criado com sucesso!"
    			else
      				flash[:alert] = "Por favor, preencha todos os campos para criar um comentario."
    			end
    			redirect_to @anuncio
    		end
    		format.js
  		end
  	end

	def destroy 
		@comentario = Comentario.find(params[:id])
		@comentario.destroy
		redirect_to @comentario.anuncio, notice: "Comentario excluido com sucesso."
	end

	def comentario_params
      params.require(:comentario).permit(:nome, :corpo)
    end
end