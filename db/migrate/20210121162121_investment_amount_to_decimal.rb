class InvestmentAmountToDecimal < ActiveRecord::Migration[6.1]
  def up
    change_column :investments, :investment_amount, :decimal
  end
  def down
    change_column :investments, :investment_amount, :float
  end
end
