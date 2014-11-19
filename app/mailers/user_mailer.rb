class UserMailer < ActionMailer::Base
  default from: "denyjav@yahoo.com.br"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_comentario.subject
  #
  def new_comentario(anuncio, comentario)
    @anuncio = anuncio
    @comentario = comentario
    @user = anuncio.user

    mail to: @user.email, subject: "Novo comentario recebido"
  end
end
