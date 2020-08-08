Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :teams, only: %i[index update] do
        scope module: 'teams' do
          resources :users, only: %i[update]
        end
      end
    end
  end
end
