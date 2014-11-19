class CreateAnuncios < ActiveRecord::Migration
  def change
    create_table :anuncios do |t|
      t.string :descricao
      t.float :preco
      t.string :titulo
      t.string :imagem
      t.boolean :favorito

      t.timestamps
    end
  end
end
