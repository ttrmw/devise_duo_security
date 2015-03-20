Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  get "home/foo"
  get "home/bar"
  get "home/baz"
end
