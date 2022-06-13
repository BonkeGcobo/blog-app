class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :Author
      t.string :Title
      t.text :Text
      t.datetime :CreatedAt
      t.datetime :UpdatedAt
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamps
    end
  end
end
