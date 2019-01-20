class CreateTraivans < ActiveRecord::Migration[5.2]
  def change
    create_table :traivans do |t|
      t.string :fullname
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
