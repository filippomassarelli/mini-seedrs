class CreateInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :investments do |t|
      t.string :user_name
      t.float :investment_amount
      t.string :currency
      t.belongs_to :campaign, index: true

      t.timestamps
    end
  end
end

#specify that association is such that each investment has one campaign it is associated to 
#  index:true allows us to sort through investments faster