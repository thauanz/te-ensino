class CreateMatriculations < ActiveRecord::Migration
  def self.up
    create_table :matriculations do |t|
      t.references :user
      t.references :course
      t.boolean :enabled, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :matriculations
  end
end
