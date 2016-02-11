require 'game_parameters'
require 'player_options'
require 'web_ttt'
require 'board_adapter'
require 'players'

class TTTController

  def self.call(env)
    route = env['REQUEST_PATH']
    request = Rack::Request.new env
    if route == '/'
      landing_page
    elsif route == '/player_options'
      chosen_player_type = request.params[GameParameters::PLAYER_TYPE]
      chosen_player_type = env['rack.session'][GameParameters::PLAYER_TYPE] = chosen_player_type

      @game_state = WebTTT.new(GameParameters.new(request.params, request.session, BoardAdapter.new), Players.new, GridFormatter.new).play
      game_page

    elsif route == '/next_move'

     p 'next move has been made'
      @game_state = WebTTT.new(GameParameters.new(request.params, request.session, BoardAdapter.new), Players.new, GridFormatter.new).play_move

     #Change @game_state into JSON and return in the body of the response rather than the erb here
     # game_page
    end
  end

  private

  def self.erb(template)
    @player_options =  PlayerOptions::all
    path = File.expand_path("#{template}", "views")
    ERB.new(File.read(path)).result(binding)
  end

  def self.landing_page
    template = erb('player_options.erb')
    [200, {}, [template]]
  end

  def self.game_page
    template = erb('game.erb')
    [200, {}, [template]]
  end
end
