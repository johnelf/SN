SN::Application.routes.draw do

  match "/" => "homepage#show", :via => :post
  match "/" => "homepage#authenticate", :via => :get

  root 'homepage#show'
end
