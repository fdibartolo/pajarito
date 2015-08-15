Rails.application.routes.draw do
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/ }

  root 'main#index'
end
