Rails.application.routes.draw do
  get 'searches/index'
  post 'searches/create'
  post 'searches/good'
  post 'searches/destroy'

  get 'tests/index'

  get 'home/index'
  get 'translation/index'
  get 'typings/index'

  root 'home#index'
end
