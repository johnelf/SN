SN::Application.routes.draw do
  get "time_line/index"
  get "callback/index"
  get "welcome/index"
  root :to => "welcome#index"
end
