require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'

    namespace :admin do
    end
  end

  namespace 'api', default: { format: 'json' }, path: '/' do
    namespace :v1 do
    end
  end

  get 'wickedpdf', to: 'wickedpdf#index'

  get 'dhalang', to: 'dhalang#index'
  get 'convert', to: 'dhalang#convert'

  get 'grover', to: 'grover#index'

  get 'prawn', to: 'prawn#index'
  get 'prawn/generate', to: 'prawn#generate'

  get 'invoice_printer', to: 'invoice_printer#index'
end
