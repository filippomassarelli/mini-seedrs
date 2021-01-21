class ChangeColumn < ActiveRecord::Migration[6.1]
  def up
    change_column :campaigns, :investment_multiple, :decimal
  end
  def down
    change_column :campaigns, :investment_multiple, :float
  end
end
