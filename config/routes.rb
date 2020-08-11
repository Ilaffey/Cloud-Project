Rails.application.routes.draw do
  resources :appointments
  resources :doctorprofiles
  resources :patients
  devise_for :users
  


root 'homepage#index'



get '/signedinuserprofile' => 'doctorprofiles#signedinuserprofile'
get '/doctorprofiles/:id', to: 'doctorprofiles#show', as: 'doctorprofile_user'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
