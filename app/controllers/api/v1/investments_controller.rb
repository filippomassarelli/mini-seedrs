module Api
    module V1
        class InvestmentsController < ApplicationController

            before_action :find_investment, only: [:show, :update, :destroy]


            def index
                investments = Investment.order('created_at DESC');
                render json: {status: 'SUCCESS', message:'Loaded investments', data:investments}, status: :ok 
            end

        # Here we need to definie the a the controller actions for each route
     
            def create
                # binding.irb
     
                investment = Investment.new(investment_params)
                # campaign = Campaign.find(id=investment[:campaign_id])
                

                if investment.save
                    render json: investment, status: :created


                else
                    render json: investment.errors, status: :unprocessable_entity
                end   
            end


            private

            def investment_params
                params.permit(
                    :campaign_id,
                    :user_name, 
                    :investment_amount, 
                    :currency
                )
            end
    
            def find_investment
                @investment = Investment.find(params[:id])
            end
    


        end
    end
end