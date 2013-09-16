SN::Application.routes.draw do
  get '/callback/index' => 'callback#index'
  get '/welcome/index' => 'welcome#index'

  root 'welcome#index'
end
