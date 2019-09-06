require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)

    redirect '/play'
  end

  get '/' do
    erb(:index)
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.opponent)
    if @game.game_over?
      redirect '/gameover'
    else
      erb(:attack)
    end
  end

  post '/switch-turns' do

    $game.switch_turns
 
    redirect '/play'
  end

  get '/gameover' do
    @game = $game
    erb(:gameover)
  end

  run! if app_file == $0


end
