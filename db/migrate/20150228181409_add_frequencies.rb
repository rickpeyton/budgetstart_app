class AddFrequencies < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.string :name
      t.integer :value
      t.timestamps
    end
  end
end
