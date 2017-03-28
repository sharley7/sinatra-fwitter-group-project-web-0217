require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'prsoeublic'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end


  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
   end


end
