Rails.application.routes.draw do
  get 'tests/index'
  get 'home/index'
  get 'translation/index'
  get 'typings/index'

  root 'home#index'
end
