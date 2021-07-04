Rails.application.routes.draw do
  get '/', to: 'translation#index'
  get 'translation/test'
  get 'translation/key'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
