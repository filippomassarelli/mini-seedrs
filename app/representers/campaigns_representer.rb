class CampaignsRepresenter

    def initialize(campaigns)
        @campaigns = campaigns
    end

    def as_json
        @campaigns.map do |campaign|
            {
                # id: campaign.id,
                name: campaign.name,
                image: campaign.image,
                percentage_raised: (campaign.percentage_raised + ( ( Investment.where(:campaign_id => campaign.id).map { |record| record[:investment_amount] }.sum ) * 100 / campaign.target_amount)).round(2),
                target_amount: campaign.target_amount,
                sector: campaign.sector,
                country: campaign.country,                
                investment_multiple: campaign.investment_multiple
                
                # associated_investments: Investment.where(:campaign_id => campaign.id).count,
                # associated_investments: associated_investments,
                # amount_raised: (campaign.percentage_raised * campaign.target_amount / 100).round(2),
                # old_percentage_raised: campaign.percentage_raised,
                
            }
        end

    end

    private

    # def associated_investments
    #     Investment.where(:campaign_id => campaign.id).count
    # end
    # Why doesn't the above work? need to study local variables properly


    attr_reader :campaigns


end


