class AddCategoriaToAnuncios < ActiveRecord::Migration
  def change
    add_column :anuncios, :categoria, :string
  end
end
