class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private #porque essa sessão é privada? Resposta: Para garantir que esse método não 
  			# seja acessível como uma action de um controller.

  def current_user
  	@current_user ||= if session[:user_id] # esse ||= evita que toda vez que current_user for chamado, o método 
  											#find_by_id seja executado, pois o valor será cachiado na variável 
  											#@current_company após uma primeira exibição
  		User.find_by_id(session[:user_id])
  	end
  end
  helper_method :current_user #isso diz às views que este método existe e que precisamos dele no layout
end								#os controller, por padrão, terá acesso a este método, mas as views, não
