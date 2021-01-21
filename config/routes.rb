Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :campaigns, only: [:index, :show]
      resources :investments, only: :create
    end
  end
end
