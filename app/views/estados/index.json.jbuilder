json.array!(@estados) do |estado|
  json.extract! estado, :id, :nome, :sigla
  json.url estado_url(estado, format: :json)
end
