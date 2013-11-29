SN::Application.routes.draw do

  match "/" => "homepage#show", :via => :get
  match "/" => "callback#callback", :via => :post
  #match "/connect" => "homepage#connect", :via => :get

  root 'homepage#show'
end
