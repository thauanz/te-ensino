class AssetsLessons < ActiveRecord::Migration
  def self.up
    create_table :assets_lessons, :id => false do |t|
      t.integer :asset_id, :null => false
      t.integer :lesson_id, :null => false
    end
  end

  def self.down
    drop_table :assets_lessons
  end
end
