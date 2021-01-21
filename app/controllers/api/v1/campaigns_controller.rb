module Api
    module V1
        class CampaignsController < ApplicationController

            def index
                campaigns = Campaign.all
                render json: CampaignsRepresenter.new(campaigns).as_json
            end

            def show
                campaign = Campaign.find(params[:id])
                render json: CampaignRepresenter.new(campaign).as_json            
            end

        end
    end
end