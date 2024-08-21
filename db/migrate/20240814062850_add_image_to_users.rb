class AddImageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_icon, :string
    add_column :users, :introduction, :string
  end
end
