Rails.application.routes.draw do
	
  	# devise_for :authors

  	devise_for :authors, controllers: {  
	  passwords: 'authors/passwords',
	  sessions: 'authors/sessions',
	  confirmations: 'authors/confirmations',
	  registrations: 'authors/registrations',
	}

	as :author do
		get 'login' => 'authors/sessions#new', as: :new_user_session
		# get 'update' => 'authors/registrations#new', as: :edit_author_registration_path
	end

	root to: "blog/posts#index"

	namespace :authors do
		get 'account' => 'accounts#show', as: :account
		# get 'account/edit' => 'accounts#edit', as: :edit_account
		resources :posts
	end

	scope module: 'blog' do
  		get 'about' => 'pages#about', as: :about
		get 'contact' => 'pages#contact', as: :contact
		get 'posts' => 'posts#index', as: :posts
		get 'posts/:id' => 'posts#show', as: :post
  	end

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
