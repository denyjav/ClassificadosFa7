require "bcrypt"

class User < ActiveRecord::Base	
	has_many :anuncios

	def password=(new_password)
		@password = new_password
		self.senha_criptografada = BCrypt::Password.create(@password)
	end

	def password
		@password
	end

	def valida_senha?(senha_to_validar) # Decorar essa bosta também pra não passar 10 horas com erros bobos
		BCrypt::Password.new(senha_criptografada) == senha_to_validar
	end
end
