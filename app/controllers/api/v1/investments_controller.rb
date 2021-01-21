module Api
    module V1
        class InvestmentsController < ApplicationController

            # Here we need to definie the a the controller actions for each route
             
            def create
     
                investment = Investment.new(investment_params)

                # binding.irb

                if investment.currency != 'GBP'

                    render json: {status: 'ERROR 406', message:'Invalid investment: currency must be GBP', data:investment.currency}, status: :not_acceptable 
                
                elsif investment.save

                    render json: investment, status: :created

                else
                    render json: investment.errors, status: :unprocessable_entity
                end   
            end


            private

            def investment_params
                params.require(:investment).permit(
                        :campaign_id,
                        :user_name, 
                        :investment_amount, 
                        :currency
                    )
            end

        end
    end
end