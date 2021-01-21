module Api
    module V1
        class CampaignsController < ApplicationController

            before_action :find_campaign, only: [:show]

            def index
                campaigns = Campaign.all
                render json: CampaignsRepresenter.new(campaigns).as_json
            end

            def show
                render json: {status: 'SUCCESS', message:'Loaded campaign', data:@campaign}, status: :ok 
            end

        private 

        def find_campaign
            @campaign = Campaign.find(params[:id])
        end

        end
    end
end