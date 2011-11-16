class AddUserIdToProfStars < ActiveRecord::Migration
  def change
    add_column :prof_stars, :user_id, :integer
  end
end
