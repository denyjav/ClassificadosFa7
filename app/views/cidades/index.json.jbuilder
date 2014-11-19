json.array!(@cidades) do |cidade|
  json.extract! cidade, :id, :cep, :bairro
  json.url cidade_url(cidade, format: :json)
end
