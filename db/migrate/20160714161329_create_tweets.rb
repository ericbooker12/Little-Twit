class CreateTweets < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  		t.string :content, presence: true
  		t.integer :user_id

  		t.timestamp null: false
  	end
  end
end
P