class ModifyExpense < ActiveRecord::Migration
  def change
    change_table :expenses do |t|
      t.remove :frequency
      t.column :frequency_id, :integer
    end
  end
end
