Rails.application.routes.draw do
  #get 'products/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	get 'products/result' => 'products#result'
   resources :products
  root 'products#index'
  

end
