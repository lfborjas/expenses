class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.float :quantity
      t.text :detail
      t.float :balance_before
      t.float :balance_after

      t.timestamps
    end
  end
end
