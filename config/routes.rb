Rails.application.routes.draw do
  concern :active_scaffold_association, ActiveScaffold::Routing::Association.new
  concern :active_scaffold, ActiveScaffold::Routing::Basic.new(association: true)
  resources :schools, concerns: :active_scaffold
  resources :batches, concerns: :active_scaffold
  resources :courses, concerns: :active_scaffold
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :courses, concerns: :active_scaffold do
  #   member do
  #     post "enroll"
  #   end
  # end

  resources :home do
    member do
      post "enroll"
    end

    collection do
      post :approve_enrollment
      get :approve_student_batches
      get :show_students
    end
  end

  resources :users
  root to: "home#index"
end
