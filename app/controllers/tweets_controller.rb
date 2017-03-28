class TweetsController < ApplicationController

   get "/tweets" do
    if logged_in?
     @tweets = Tweet.all
     @user = User.find_by(id: session[:user_id])
     erb :'/tweets/tweets'
   else
     redirect to '/login'
   end
 end

   get '/tweets/new' do
    if logged_in?
      erb :'/tweets/new'
    else
     redirect to "/login"
   end
 end

   post '/tweets' do
     if params["content"] == ""
       redirect to "tweets/new"
     else
       @tweet = Tweet.create(content: params["content"], user_id: session[:user_id])
       redirect to "/tweets"
     end
   end

   get '/tweets/:id/edit' do
     if logged_in?
        @tweet = Tweet.find_by(id: params[:id])
       if @tweet.user_id == current_user.id
        erb :'tweets/edit'
         else
        redirect to '/tweets'
      end
      else
      redirect to "/login"
      end
   end


   get '/tweets/:id' do
    if logged_in?
     @tweet = Tweet.find_by(id: params[:id])
     erb :'tweets/show'
   else
     redirect to '/login'
   end
 end

   post '/tweets/:id' do
     @tweet = Tweet.find_by(id: params[:id])
     if params["content"] != ""
       @tweet.update(content: params["content"])
        redirect to "/tweets/#{@tweet.id}"
      else
        redirect to "/tweets/#{@tweet.id}/edit"
   end
 end

   delete '/tweets/:id/delete' do
    if logged_in?
    @tweet = Tweet.find_by(id:params["id"])
      if @tweet.user_id == current_user.id
       @tweet.delete
       redirect to '/tweets'
     else
       redirect to '/tweets'
     end
   else
     redirect to '/login'
   end
 end


end
