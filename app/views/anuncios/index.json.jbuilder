json.array!(@anuncios) do |anuncio|
  json.extract! anuncio, :id, :descricao, :preco, :titulo, :imagem, :favorito
  json.url anuncio_url(anuncio, format: :json)
end
