SN::Application.routes.draw do

  match "/" => "homepage#show", :via => [:get, :post]

  root 'homepage#show'
end
