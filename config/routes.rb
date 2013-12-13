SN::Application.routes.draw do

  match "/" => "homepage#show", :via => :get
  match "/" => "callback#callback", :via => :post
  match "/test" => "test#test", :via => :get

  root 'homepage#show'
end
