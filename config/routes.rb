Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :scores
  
  resources :courses do
    resources :course_details, only: [:index, :new, :create, :destroy, :show]
    resources :scores, only: [:index, :new, :create, :destroy, :show]
  end

  scope :courses, via: [:get, :post] do
    match 'initializeCourseDetails' => 'courses#initialize_course_details', as: :initialize_course_details 
  end

  scope :scores, via: [:get, :post] do
    match 'initializeScoreDetails' => 'scores#initialize_score_details', as: :initialize_score_details
  end
end
