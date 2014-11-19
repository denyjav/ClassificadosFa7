module AnunciosHelper
	def anuncio_titulo(anuncio)
		titulo = raw("#{h(anuncio.titulo)} - #{h(anuncio.user.nome)}")

		if anuncio.favorito
			titulo + content_tag(:strong, "(Mais Visto)")
		else
			titulo
		end
	end
end
