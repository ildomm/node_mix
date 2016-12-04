require 'sidekiq/web'

Rails.application.routes.draw do
  get 'api/find'
  mount Sidekiq::Web => '/sidekiq'
end

