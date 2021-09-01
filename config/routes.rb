Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'public/homes#top'
  get "/about" =>"public/homes#about"

  scope module: :admin do
    get 'admin' => "homes#top"
  end

  devise_for :admin, controllers: { registrations: 'admin/registrations', sessions: 'admin/sessions' }

  devise_for :customers, controllers: { registrations: 'public/registrations', sessions: 'public/sessions' }

  namespace :admin do
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:new, :create, :destroy]
  end

end

