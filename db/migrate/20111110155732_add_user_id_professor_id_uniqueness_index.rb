class AddUserIdProfessorIdUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :prof_stars,  [:professor_id, :user_id], :unique => true
  end

  def self.down
    remove_index :prof_stars, [:professor_id, :user_id]
  end
end

