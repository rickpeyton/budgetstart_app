class DropColumnFromFrequency < ActiveRecord::Migration
  def change
    change_table :frequencies do |t|
      t.remove :value
      t.decimal :value
    end
  end
end
