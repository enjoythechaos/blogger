class AddNameEmailPasswordToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :name, :string
    add_column :authors, :email, :string
    add_column :authors, :password, :string
  end
end
