class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.float :price
      t.boolean :enabled, :default => true
      t.string :workload
      t.integer :amount
      t.integer :tutor_id

      t.timestamps
    end
    
    add_index :courses, :name, :unique => true
  end

  def self.down
    drop_table :courses
  end
end
