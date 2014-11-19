class Comentario < ActiveRecord::Base
	belongs_to :anuncio
	validates_presence_of :corpo, :anuncio_id, :nome
end
