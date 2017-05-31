Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get('/about', {to: 'about#index'})
get('/contact', {to: 'contact#index'})
post('/contact', {to: 'contact#create', as: 'contact_submit'})

namespace :api, defaults: { format: :json} do
    namespace :v1 do
      #api/v1/products/json    => INDEX
      #api/v1/products/1.json  => SHOW
    resources :products, only: [:index, :show]
  end
end

resources :products do
  resources :reviews do
    resources :likes, only: [:create, :destroy]
    resources :votes
  end
end


resources :tags, only: [:index, :show]
#resources :products, only: [:index, :show]
#resources :products, except: [:index, :show]

#(HTTP Verb: delete - path: /questions/:id ) ==> questions controller / destroy action
 #delete '/questions/:id', to: 'questions#destroy', as: 'question_deletion'

# HTTP Verb: get - path: /questions/:id/edit ) ==> questions controller / edit action
# (HTTP Verb: get - path: /questions/:id ) ==> questions controller / show action
# (HTTP Verb: post - path: /questions/:id/comments ) ==> comments controller / create action
# (HTTP Verb: get - path: /faq ) ==> home controller / faq action

#get '/questions/:id', to: 'questions#edit', as: question_edit
#get  '/questions/:id', to: 'questions#show', as: question_show
#post '/questions/:id', to: 'questions#create', as: question_create
#get '/faq', to: 'home#faq', as faq_action

resources :users, only: [:new, :create]
resources :sessions, only: [:new, :create] do
  delete :destroy, on: :collection
end

namespace :admin do
  resources :dashboard, only: [:index]
end


   root 'welcome#index'
end
