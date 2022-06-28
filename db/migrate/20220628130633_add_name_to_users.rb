class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :name, :string
    add_column :members, :surname, :string
  end
end
