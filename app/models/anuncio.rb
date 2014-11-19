class Anuncio < ActiveRecord::Base

   has_attached_file :imagem, :styles => { :medium => "500x500>", :thumb => "150x150>" }  #, :default_url => "/images/:style/missing.png"
   scope :most_recent, order("created_at DESC")
   validates_attachment_content_type :imagem, :content_type => /\Aimage\/.*\Z/
   validates_attachment_file_name :imagem, :matches => [/png\Z/, /jpeg\Z/,/jpg\Z/]
   # Explicitly do not validate
   do_not_validate_attachment_file_type :imagem

   belongs_to :user
	has_many :comentarios
	scope :most_recent, order("created_at DESC")
	validates_presence_of :descricao, message: "- campo obrigatorio"
	validates_presence_of :titulo, message: "- campo obrigatorio"
	validates_presence_of :preco, :user_id, message: "- campo obrigatorio"


end
