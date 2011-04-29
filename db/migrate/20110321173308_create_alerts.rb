class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table :alerts do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.date :expire, :null => false
      t.boolean :enabled, :default => false
      t.references :user
      t.references :course

      t.timestamps
    end
  end

  def self.down
    drop_table :alerts
  end
end
