class AddUseridToSubcomments < ActiveRecord::Migration
  def change
    add_column :subcomments, :user_id, :integer
  end
end
