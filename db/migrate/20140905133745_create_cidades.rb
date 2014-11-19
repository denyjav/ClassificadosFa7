class CreateCidades < ActiveRecord::Migration
  def change
    create_table :cidades do |t|
      t.string :cep
      t.string :bairro

      t.timestamps
    end
  end
end
