class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :content
      t.references :author, null: false, foreign_key:  { to_table: :users }

      t.timestamps
    end
  end
end
