SN::Application.routes.draw do

  match "/" => "homepage#show", :via => [:get, :post]
  match "/callback" => "homepage#callback", :via => [:get, :post]
  match "/connect" => "homepage#connect", :via => :get

  root 'homepage#show'
end
