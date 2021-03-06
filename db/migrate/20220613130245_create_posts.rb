class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :Title
      t.text :Text
      t.bigint :CommentsCounter, null:false, default: 0
      t.bigint :LikesCounter, null:false ,default: 0

      t.timestamps
    end
  end
end
