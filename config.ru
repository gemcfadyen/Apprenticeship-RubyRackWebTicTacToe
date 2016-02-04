#Setup Load Path
lib = File.expand_path("../lib", __FILE__)
ttt_lib = File.expand_path("../../Apprenticeship-RubyTicTacToe/lib", __FILE__)
$:.unshift(lib).unshift(ttt_lib)

require 'ttt_controller'

use Rack::Static, :urls => ['public'], :root => 'public'
use Rack::Static, :urls => ['views'], :root => 'views'
use Rack::Static, :urls => ['/css', '/images'], :root => 'public'
use Rack::Session::Cookie,
  :key => 'rack.session',
  :path => '/',
  :expire_after => 14400, # In seconds
  :secret => 'secret_msg'

run TTTController
