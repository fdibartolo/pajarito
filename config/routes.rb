Rails.application.routes.draw do
  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/ }

  get '/photos' => 'main#photos', defaults: { format: :json }

  root 'main#index'
end
