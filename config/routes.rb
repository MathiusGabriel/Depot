Depot::Application.routes.draw do
  devise_for :users
  #  controllers: {:registrations => "registrations"}

  resources :users_admin, :controller => 'users'

  #as :user do
  #get "/register", to: "registrations#new", as: "register"
  #end

  get 'admin' => 'admin#index'

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
  end

  resources :orders

  resources :line_items

  resources :carts

  resources :products do
    get :who_bought, on: :member
  end

  root 'store#index', as: 'store'

end
