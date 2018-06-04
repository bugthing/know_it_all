Rails.application.routes.default_url_options[:host] = '0.0.0.0:3001'

Rails.application.routes.draw do
  resources :documents
end
