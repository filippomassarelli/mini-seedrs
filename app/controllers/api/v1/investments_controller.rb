module Api
    module V1
        class InvestmentsController < ApplicationController

            def index
                investments = Investment.order('created_at DESC');
                render json: {status: 'SUCCESS', message:'Loaded investments', data:investments}, status: :ok 
            end

        # Here we need to definie the a the controller actions for each route
     


        end
    end
end