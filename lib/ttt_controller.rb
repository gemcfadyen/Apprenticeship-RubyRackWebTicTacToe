require 'game_parameters'
require 'player_options'

class TTTController

  def self.call(env)
    route = env['REQUEST_PATH']
    request = Rack::Request.new env
    if route == '/'
      landing_page
    elsif route == '/player_options'
      chosen_player_type = request.params[GameParameters::PLAYER_TYPE]
      chosen_player_type = env['rack.session'][GameParameters::PLAYER_TYPE] = chosen_player_type
      #game = WebTTT.new(GameParameters.new(request.params, request.session), Players.new)
      #latest_board = game.play(move, board)
      #look up the template for player_options.erb andn that is the body
      [200, {}, {}]
    elsif route == '/next_move'
      #game = Game.new(player_option)
      #latest_board = game.play(3, board)
      # look up the erb for the template game.erb and put that as the body
      [200, {}, {}]
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
    return  [200, {}, [template]]
  end
end
