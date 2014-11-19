class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to root_path, notice: "Usuario salvo com sucesso."
		else
			render action: "new"
		end
	end

	def edit
    	@user = User.find(params[:id])
  	end

	def user_params
      params.require(:user).permit(:nome, :email, :password)
    end
end