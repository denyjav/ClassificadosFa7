class AddUserIdToAnuncios < ActiveRecord::Migration
  def change
    add_column :anuncios, :user_id, :integer
    add_index :anuncios, :user_id
  end
end
