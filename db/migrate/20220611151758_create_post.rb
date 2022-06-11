class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :Author, index: true, foreign_key: {to_table: :users}
      t.string :Title, :limit => 32
      t.text :Text
      t.timestamps
      t.bigint :CommentsCounter
      t.bigint :LikesCounter
    end
  end
end
