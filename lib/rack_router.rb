require 'erb'
require 'grid_formatter'
require 'move_loader'
require 'player_options'
require 'player_preparer'
require 'web_board_factory'
require 'web_player_factory'
require 'web_tic_tac_toe'
require 'web_display_to_board_adapter'

class RackRouter
  def self.call(env)
    request_path = env['REQUEST_PATH']

    if request_path == '/'
      template = erb('player_options.erb')
      return  [200, {}, [template]]
    end

    if request_path == '/player_options'
      request = Rack::Request.new env
      p "The params are : " + request.params.to_s # contains the union of GET and POST params
      request.session[:player_type] = request.params['player_type']
      p "Placed choice in session " + request.session.inspect

      @game_state = WebTicTacToe.new(
        WebBoardFactory.new(WebDisplayToBoardAdapter.new),
        GridFormatter.new,
        PlayerPreparer.new(WebPlayerFactory.new, MoveLoader.new)
      ).play_ttt_using(request.params)

      template = erb('game.erb')
      return [200, {}, [template]]
    end


    if request_path == '/next_move'
      request = Rack::Request.new env
      p 'earlier player choice taken from session was: ' + request.session[:player_type].inspect

      request.params['player_type'] = request.session[:player_type]

      @game_state = WebTicTacToe.new(
        WebBoardFactory.new(WebDisplayToBoardAdapter.new),
        GridFormatter.new,
        PlayerPreparer.new(WebPlayerFactory.new, MoveLoader.new)
      ).play_ttt_using(request.params)

      template = erb('game.erb')
      return [200, {}, [template]]
    end
  end

  def self.erb(template)
    @player_options =  PlayerOptions::all
    path = File.expand_path("#{template}", "../Apprenticeship-RubyWebTicTacToe/views")
    ERB.new(File.read(path)).result(binding)
  end

  private
  def get_landing_page
    template = erb('player_options.erb')
    return  [200, {}, [template]]
  end
end
