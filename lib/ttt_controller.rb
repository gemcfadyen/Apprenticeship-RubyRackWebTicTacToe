class TTTController

  def self.call(env)
    route = env['REQUEST_PATH']
    request = Rack::Request.new env
    if route == '/'
      #
      # PlayerOptionDisplay.new.show_player_options
      # ResponseBody.with()
      [200, {}, {}]
    elsif route == '/player_options'
      chosen_player_type = request.params['player_type']
      chosen_player_type = env['rack.session']['player_type'] = chosen_player_type
      # selected_params = GameParameters.new(params, session).play which will call
      #game = Game.new(selected_params.player_option)
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
end