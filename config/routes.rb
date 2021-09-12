Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 devise_for :admin, controllers: { registrations: 'admin/registrations', sessions: 'admin/sessions' }
 devise_for :customers, controllers: { registrations: 'public/registrations', sessions: 'public/sessions' }

 root to: 'public/homes#top'
  get "/about" =>"public/homes#about"


  scope module: :public do
    resources :items, only: [:index,:show]

    get "/customers/my_page", to: 'customers#show', as: :customer
    get "/customers/unsubscribe", to: 'customers#unsubscribe', as: :customer_unsubscribe
    patch "/customers/withdrawal", to: 'customers#withdrawal', as: :customer_withdrawal
    resource :customers, only: [:edit, :update]

    delete "/cart_items/destroy_all", to: 'cart_items#destroy_all', as: :cart_items_destroy_all
    resources :cart_items, only: [:index, :update, :destroy, :create]

    post "/orders/confirm", to: 'orders#confirm', as: :order_confirm
    get "/orders/thanks", to: 'orders#thanks', as: :order_thanks
    resources :orders, only: [:new, :create, :index, :show]

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  scope module: :admin do
    get 'admin' => "homes#top"
  end

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_details, only: [:update]
  end

end
