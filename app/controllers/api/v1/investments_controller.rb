module Api
    module V1
        class InvestmentsController < ApplicationController

            # Here we need to definie the a the controller actions for each route
             
            def create
                # binding.irb
     
                investment = Investment.new(investment_params)
                

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

        end
    end
end