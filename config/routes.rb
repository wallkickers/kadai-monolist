Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"

  get "signup", to: "users#new"
  resources :users, only: [:show, :new, :create]
  
  
end


  #6: "signup"の記述＆to: により「/signup」で、users#newアクションを行うことが可能。
  #7: #show=ユーザーの詳細ページ　#new=新規登録画面用　#create=新規作成