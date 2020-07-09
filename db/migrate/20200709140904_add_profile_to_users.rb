class AddProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :bio, :text

    change_column :users, :name, :string, default: "", null: false
  end
end
