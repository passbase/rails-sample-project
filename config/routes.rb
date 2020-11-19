Rails.application.routes.draw do
  resources :users

  get "welcome/index"

  # Receive webhook
  post "passbase-webhooks", to: "webhook#receive_webhook"

  root "welcome#index"
end
