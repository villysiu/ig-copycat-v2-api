class AddDefaultValueToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:users, :bio, '')
    change_column_default(:users, :name, '')
  end
end
