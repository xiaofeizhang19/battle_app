require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1])
    $player_2 = Player.new(params[:player_2])
    #session[:player_1] = params[:player_1]
    #session[:player_2] = params[:player_2]
    redirect '/play'
  end

  get '/' do
    erb(:index)
  end

  get '/play' do
    @player_1 =  $player_1.name
    @player_2 =  $player_2.name
    erb(:play)
  end

  get '/attack' do
    "<h1>Marley has been attacked</h1>"
  end

  run! if app_file == $0


end
