
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    post = Post.create(post_params)

    erb :index
  end

  get '/posts' do

    @posts = Post.all

    erb :index
  end

  get '/posts/:id' do
    post = params["id"]
    @post = Post.all.find(post)

    erb :show
  end

    get '/posts/:id/edit' do
      @post = Post.find(params["id"])
      erb :edit
    end

    delete '/posts/:id/deleted' do
      post = params["id"]
      @post_to_delete = Post.all.find(post)
      @post_to_delete.delete
      redirect '/posts'
    end

    get '/posts/:id/deleted' do
      erb :delete
    end

    patch '/posts/:id' do
      post_id = params["id"]
      @post = Post.all.find(post_id)
      @post.update(post_params)
      redirect "/posts/#{@post.id}"
    end

    private
    def post_params
      params["posts"]
    end


end
