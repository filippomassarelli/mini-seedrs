module Api
    module V1
        class CampaignsController < ApplicationController

            before_action :find_campaign, only: [:show, :update, :destroy]

            def index
                campaigns = Campaign.order('created_at DESC');
                render json: {status: 'SUCCESS', message:'Loaded campaigns', data:campaigns}, status: :ok 
            end

            def show
                render json: {status: 'SUCCESS', message:'Loaded campaign', data:@campaign}, status: :ok 
            end
      
            def create
                campaign = Campaign.new(campaign_params)

                if campaign.save
                    render json: campaign, status: :created
                else
                    render json: campaign.errors, status: :unprocessable_entity
                end   
            end



        private 
# These are functions to remain DRY

        def campaign_params
            params.permit(
                :name, 
                :image, 
                :percentage_raised, 
                :target_amount,
                :sector,
                :country,
                :investment_multiple,
                :currency,
                :open
            )
        end

        def find_campaign
            @campaign = Campaign.find(params[:id])
        end

        end
    end
end