class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :publish  ,default: false
      t.references :traivan, foreign_key: true

      t.timestamps
    end
  end
end
