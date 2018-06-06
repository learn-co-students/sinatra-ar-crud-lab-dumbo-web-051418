
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end


  get '/posts/new' do
    erb :new
  end

  post '/posts/:id' do
    @name = params[:name]
    @content = params[:content]
    Post.create(name:@name, content: @content)

    redirect "/posts"
  end

  get '/posts/:id' do
    @id = params[:id]
    post = Post.all.find(@id)
    @name = post.name
    @content = post.content
    erb :show
  end

  get '/posts/:id/edit' do
    @id = params[:id]
    post = Post.all.find(@id)
    @name = post.name
    @content = post.content
    erb :edit
  end

  patch '/posts/:id' do
    @name = params[:name]
    @content = params[:content]
    @id = params[:id]
    @post = Post.all.find(@id)
    @post.name = @name
    @post.content = @content
    @post.save
    redirect "/posts/#{@id}"
  end

  delete '/posts/:id/delete' do
    @id = params[:id]
    post = Post.all.find(@id)
    post.delete
    erb :delete
  end

end
