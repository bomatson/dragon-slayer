class CreateKnights < ActiveRecord::Migration
  def change
    create_table :knights do |t|
      t.string :weapon, default: 'sword'
      t.integer :health, default: 100, null: false
      t.timestamps
    end
  end
end
