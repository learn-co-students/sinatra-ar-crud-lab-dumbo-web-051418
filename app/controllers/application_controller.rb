
require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/posts' do
    erb :index
  end

  post '/posts' do
    Post.create(params)
    redirect '/posts'
  end

  get '/posts/new' do
    erb :new
  end

  get "/posts/:id" do
    @post = Post.find(params[:id])
    erb :specific_post
  end

  get "/posts/:id/edit" do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch "/posts/:id" do
    @post = Post.find(params[:id])
    param_copy = params.dup
    param_copy.delete "id"
    param_copy.delete "_method"
    Post.update(param_copy)
    redirect '/posts'
  end

  delete "/posts/:id" do
    Post.find(params[:id]).destroy
    redirect '/posts'
  end
end
