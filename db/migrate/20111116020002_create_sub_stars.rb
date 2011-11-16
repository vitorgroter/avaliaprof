class CreateSubStars < ActiveRecord::Migration
  def change
    create_table :sub_stars do |t|
      t.integer :subject_id
      t.integer :user_id
      t.integer :stars

      t.timestamps
    end
    add_index :sub_stars,  [:subject_id, :user_id], :unique => true
  end
end
