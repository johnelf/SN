SN::Application.routes.draw do
  get "time_line/index"
  get "callback/index"
  get "welcome/index"
  match '/welcome/index' => 'welcome#index'
  match '/callback/index' => 'callback#index'

  root :to => "welcome#index"
end
