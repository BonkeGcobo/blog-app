class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :Text
      t.datetime :UpdatedAt
      t.datetime :CreatedAt

      t.timestamps
    end
  end
end
