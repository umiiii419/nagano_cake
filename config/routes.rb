Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 scope module: :admin do
    get 'admin' => "homes#top"
  end

  root to: 'public/homes#top'
  get "/about" =>"public/homes#about"

  devise_for :admin, controllers: { registrations: 'admin/registrations', sessions: 'admin/sessions' }

  devise_for :customers, controllers: { registrations: 'public/registrations', sessions: 'public/sessions' }

  namespace :admin do
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:new, :create, :destroy]
  end

  scope module: :public do
    get "/customers/my_page", to: 'customers#show', as: :customer
    resource :customers, only: [:edit, :update]
    resources :items, only: [:index,:show]
    resources :addresses, except: [:new, :show]
    resources :cart_items, except: [:new, :show, :edit]
    delete "/cart_items/destroy_all", to: 'cart_items#destroy_all', as: :cart_items_all
  end

end
