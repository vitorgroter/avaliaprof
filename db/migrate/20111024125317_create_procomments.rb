class CreateProcomments < ActiveRecord::Migration
  def change
    create_table :procomments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :professor_id

      t.timestamps
    end
    add_index :procomments, [:professor_id, :created_at]
  end
end
