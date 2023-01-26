class AddAvatorToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avator, :string
  end
end
