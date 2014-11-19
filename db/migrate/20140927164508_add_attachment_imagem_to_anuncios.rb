class AddAttachmentImagemToAnuncios < ActiveRecord::Migration
  def self.up
    change_table :anuncios do |t|
      t.attachment :imagem
    end
  end

  def self.down
    remove_attachment :anuncios, :imagem
  end
end
