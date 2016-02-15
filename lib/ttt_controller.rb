require 'game_parameters'
require 'player_options'
require 'web_ttt'
require 'board_adapter'
require 'players'

class TTTController

  def self.call(env)
    route = env['REQUEST_PATH']
    request = Rack::Request.new env

    if route == '/favicon.ico'
      default_success_response
    elsif route == '/'
      show_player_options
    elsif route == '/player_options'
      start_game(request, env);
    elsif route == '/next_move'
      play_move(request)
    end
  end

  private

  def self.erb(template)
    @player_options =  PlayerOptions::all
    path = File.expand_path("#{template}", "views")
    ERB.new(File.read(path)).result(binding)
  end

  def self.default_success_response
    [200, {}, []]
  end

  def self.show_player_options
    template = erb('player_options.erb')
    [200, {}, [template]]
  end

  def self.start_game(request, env)
      chosen_player_type = request.params[GameParameters::PLAYER_TYPE]
      env['rack.session'][GameParameters::PLAYER_TYPE] = chosen_player_type

      @game_state = WebTTT.new(GameParameters.new(request.params, request.session, BoardAdapter.new), Players.new, GridFormatter.new).play
      game_page
  end

  def self.game_page
    template = erb('game.erb')
    [200, {}, [template]]
  end

  def self.play_move(request)
    updated_state = WebTTT.new(GameParameters.new(request.params, request.session, BoardAdapter.new), Players.new, GridFormatter.new).play_move
    [200, {'Content-Type' => 'json'}, [updated_state.as_json]]
  end
end
