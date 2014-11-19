class LoginController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:user][:email])

		if user && user.valida_senha?(params[:user][:password])
			session[:user_id] = user.id #isso permite mostrar exatamente o usúário logado no sistema
			redirect_to anuncios_path   #root_path
		else
			flash.now[:alert]= "Email ou senha invalido."
			render action: "new"
		end
	end
end