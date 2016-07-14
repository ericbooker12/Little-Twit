class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username, presence: true
  		t.string :password_digest, presence: true 

  		t.timestamps null: false
  	end
  end
end
