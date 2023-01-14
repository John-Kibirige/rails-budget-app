class ChangeColumnToNewFromTrnsactions < ActiveRecord::Migration[7.0]
  change_table :trnsactions do |table|
    table.change :amount, :float
  end
end
