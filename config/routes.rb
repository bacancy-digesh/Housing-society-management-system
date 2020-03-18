Rails.application.routes.draw do
	root to: "dashbords#index"
  resources :deshbords
  resources :tenants
  resources :maintenances
  post 'update_paymet_status',to:"maintenances#update_paymet_status"
  get'search',to: "tenants#search"
  get 'maintenance_detail',to:"maintenances#maintenance_detail"
  get 'dashbord',to: "dashbords#home"
  post 'creat',to: "dashbords#create"
  devise_for :users, controllers: {registrations: 'users/registrations'}
  get 'expense',to:"expence#expense_list"
  post 'expense',to:"expence#create"
  get 'add_expense',to:"expence#add_expense"
  post 'search_expense',to: "expence#search"
  get 'search_expense',to: "expence#expense_list"
  post 'members/new',to: "members#create"
  resources :members
  resources :vehicals
  post 'search_vehical',to:"vehicals#search"
  post 'vehical_slot',to:"vehicals#vehical_slot"
  resources :notice
  post 'send_notice',to: "notice#send_notice"
  resources :users
post'complain',to: "users#complain"

  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
