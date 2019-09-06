require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    @game = Game.create(player_1, player_2)

    redirect '/play'
  end

  get '/' do
    erb(:index)
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    @game.attack(@game.opponent)
    if @game.game_over?
      redirect '/gameover'
    else
      erb(:attack)
    end
  end

  post '/switch-turns' do
    @game.switch_turns
    redirect '/play'
  end

  get '/gameover' do
    erb(:gameover)
  end

  run! if app_file == $0
end
