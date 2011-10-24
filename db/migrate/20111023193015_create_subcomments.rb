class CreateSubcomments < ActiveRecord::Migration
  def change
    create_table :subcomments do |t|
      t.text :comment
      t.integer :subject_id

      t.timestamps
    end
    add_index :subcomments, [:subject_id, :created_at]
  end
end
