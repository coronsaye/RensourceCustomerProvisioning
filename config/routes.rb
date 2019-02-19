Rails.application.routes.draw do
  #resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'customers/:type/:market', to: 'customers#fetch'
  get 'customers/select/:type/:market', to: 'customers#select'
  get 'customers/generate/:type/:count/:start/:market', to: 'customers#generate'

end