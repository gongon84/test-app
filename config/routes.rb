Rails.application.routes.draw do
  get '/', to: 'translation#index'
  get '/key', to: 'translation#key'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
