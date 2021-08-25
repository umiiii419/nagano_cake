Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admin, controllers: {   registrations: 'admin/registrations',
                                    sessions: 'admin/sessions' }
  scope module: :admin do
    get 'admin' => "homes#top"
  end

end
