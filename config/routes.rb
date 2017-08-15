Rails.application.routes.draw do
  get 'teacher_subjects/index'

  get 'teacher_subjects/show'

  get 'teacher_subjects/new'

  get 'teacher_subjects/create'

  get 'teacher_subjects/edit'

  get 'teacher_subjects/update'

  get 'teacher_subjects/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
