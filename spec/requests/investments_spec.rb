require 'rails_helper'
require 'pp'

describe 'Investments API', type: :request do

    describe 'POST /investments' do

        let!(:campaign) { Campaign.create({
            name: Faker::Company.name,
            image: Faker::Company.logo,
            percentage_raised: Faker::Number.between(from: 20, to: 200),
            target_amount: Faker::Number.decimal(l_digits: 6, r_digits: 2),
            sector: Faker::Company.industry,
            country: Faker::Address.country,
            investment_multiple: Faker::Number.decimal(l_digits: 1, r_digits: 2),
            currency: 'GBP',
            open: Faker::Boolean.boolean(true_ratio: 0.75)
        })}    

        it 'creates a new investment' do

            post '/api/v1/investments', params: {
                investment: {
                    campaign_id: "#{campaign.id}",
                    user_name: "Filippo",
                    investment_amount: 200000,
                    currency: 'GBP'
                }
            }
            # pp "Hey man this is the response: #{response}"
            expect(response).to have_http_status(:created)
        end
    end
end