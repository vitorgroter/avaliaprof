class CreateProfessorSubjectJoinTable < ActiveRecord::Migration
  def up
    create_table :professors_subjects, :id => false do |t|
      t.integer :professor_id
      t.integer :subject_id
    end
  end

  def down
    drop_table :professors_subjects
  end
end
