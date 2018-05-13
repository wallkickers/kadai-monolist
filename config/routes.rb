Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"

  get "signup", to: "users#new"
  resources :users, only: [:show, :new, :create]
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :items,only: [:new]
  
end


  #6: "signup"の記述＆to: により「/signup」で、users#newアクションを行うことが可能。
  #7: #show=ユーザーの詳細ページ　#new=新規登録画面用　#create=新規作成
  
  #8: /login へアクセスされたときには、sessions#newアクションを行う。
  #9: /login で投稿された場合は、sessions#createアクションを行う。
  #10: /logoutでdeleteが行われたときには、sessions#destroyアクションを行う。