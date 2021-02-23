# frozen_string_literal: true

Rails.application.routes.draw do
  # GET /articles requests are mapped to the index action of ArticlesController
  root "articles#index"

  resources :articles
end
