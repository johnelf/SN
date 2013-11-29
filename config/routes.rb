SN::Application.routes.draw do

  match "/" => "homepage#show", :via => :get
  match "/" => "callback#callback", :via => :post

  root 'homepage#show'
end
