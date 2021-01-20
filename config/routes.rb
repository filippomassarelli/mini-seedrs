Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      # generate all of the seven RESTful routes for each data model
      resources :campaigns 
      resources :investments
    end
  end
end

# use rails routes from terminal to check this has been done correctly
