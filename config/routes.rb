SN::Application.routes.draw do

  match "/" => "authentication#authenticate", :via => :post

  root 'homepage#show'
end
