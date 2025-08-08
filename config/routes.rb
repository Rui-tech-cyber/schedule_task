Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "plans#index" # トップページを一覧表示に設定
  resources :plans do
    resources :memos, shallow: true
  end
end
