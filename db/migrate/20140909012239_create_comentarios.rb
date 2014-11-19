class CreateComentarios < ActiveRecord::Migration
  def self.up   #aqui estava change
    create_table :comentarios do |t|
      t.string :nome
      t.text :corpo
      t.integer :anuncio_id

      t.timestamps
    end
  end
end
