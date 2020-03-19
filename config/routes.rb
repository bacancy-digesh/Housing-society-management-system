# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  devise_for :users

  resources :dashbords do
    collection do
      get 'home'
      put 'complain_status_change'
    end
  end

  resources :maintenances do
    collection do
      post 'update_paymet_status'
      get 'maintenance_detail'
    end
  end

  resources :tenants do
    collection do
      get 'search'
    end
  end

  resources :members do
    collection do
    end
  end

  resources :expense do
    collection do
      get 'expense_list'
      get 'add_expense'
      post 'add_expense'
      post 'search'
    end
  end

  resources :vehicals do
    collection do
      post 'search'
      post 'vehical_slot'
    end
  end

  resources :notice do
    collection do
      post 'send_notice'
    end
  end

  resources :users do
    collection do
      post 'complain'
    end
  end

  resources :visitors

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
