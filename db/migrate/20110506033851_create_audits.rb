class CreateAudits < ActiveRecord::Migration
  def self.up
    create_table :audits do |t|
      t.integer :user_id
      t.references :audit, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :audits
  end
end
