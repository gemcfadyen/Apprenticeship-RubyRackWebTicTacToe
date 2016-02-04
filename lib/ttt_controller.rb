class TTTController

  def self.call(env)
    route = env['REQUEST_PATH']
    request = Rack::Request.new env
    if route == '/'
      [200, {}, {}]
    elsif route == '/player_options'
      chosen_player_type = request.params['player_type']
      chosen_player_type = env['rack.session']['player_type'] = chosen_player_type
      [200, {}, {}]
    elsif route == '/next_move'
      [200, {}, {}]
    end
  end
end
