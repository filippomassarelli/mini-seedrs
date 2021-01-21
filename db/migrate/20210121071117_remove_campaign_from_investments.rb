class RemoveCampaignFromInvestments < ActiveRecord::Migration[6.1]
  def change
    remove_column :investments, :campaign, :string
  end
end
