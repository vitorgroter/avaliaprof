class CreateProfStars < ActiveRecord::Migration
  def change
    create_table :prof_stars do |t|
      t.integer :professor_id
      t.integer :stars

      t.timestamps
    end
  end
end
