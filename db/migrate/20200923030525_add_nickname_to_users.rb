class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_furigana, :string
    add_column :users, :first_furigana, :string
    add_column :users, :birthdate, :date
  end
end
