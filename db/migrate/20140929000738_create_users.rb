class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.string :password
      t.string :email
      t.string :senha_criptografada
      t.timestamps
    end
  end
end
