class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |f|
      f.string :content
      f.integer :user_id
    end
  end
end
