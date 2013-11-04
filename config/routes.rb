SN::Application.routes.draw do

  match "/" => "homepage#show", :via => :get

  root 'homepage#show'
end
