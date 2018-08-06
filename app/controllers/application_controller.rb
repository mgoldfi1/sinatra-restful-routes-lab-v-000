class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :new
  end

  post '/new' do
   @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
   @recipe.save
   redirect to('/recipes')
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end


end
