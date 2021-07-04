Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'
  get 'translation/index'
  get 'typings/index'
end
