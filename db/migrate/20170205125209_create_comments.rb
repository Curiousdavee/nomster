class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.string :rating

      t.integer :user_id
      t.integer :place_id
      t.timestamps
    end

      add_index :comments, [:user_id, :place_id]
      add_index :comments, :place_id
  end
end








if a == 5 {
puts "Hi"
else {
puts "Bye"
}

puts a == 5 ? "Hi" : "Bye"



