class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text :content
      t.references :forum
      t.references :user
      t.string :ancestry

      t.timestamps
    end
    
    add_index :messages, :ancestry
  end

  def self.down
    drop_table :messages
  end
end
