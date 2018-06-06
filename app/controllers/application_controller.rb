
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    # binding.pry
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    # binding.pry
    @post = Post.find_by_id(params[:id])
    erb :edit
  end


  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    # binding.pry
    @post.update(name:params[:name], content: params[:content])
    # @post.save
     redirect to "/posts/#{id}"
    # erb :show
  end


  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    # binding.pry
    @post.delete
    erb :deleted
  end


end
