class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :frequency
      t.integer :amount
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end
