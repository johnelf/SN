SN::Application.routes.draw do

  match "/" => "homepage#show", :via => :post and :get

  root 'homepage#show'
end
