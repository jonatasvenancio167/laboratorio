Rails.application.routes.draw do
  # get 'laboratories/index'
  # get 'laboratories/show'
  # get 'laboratories/create'
  # get 'laboratories/update'
  # get 'laboratories/destroy'
  # get 'exams/index'
  # get 'exams/show'
  # get 'exams/create'
  # get 'exams/update'
  # get 'exams/destroy'

  resources :exams
  resources :laboratories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
