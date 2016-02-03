lib = File.expand_path("../lib", __FILE__)
ttt_web = File.expand_path("../../Apprenticeship-RubyWebTicTacToe/lib", __FILE__)
$:.unshift(lib).unshift(ttt_web)

require 'rack_router'

use Rack::Static, :urls => ['public'], :root => '../../Apprenticeship-RubyWebTicTacToe/public'
use Rack::Static, :urls => ['views'], :root => '../../Apprenticeship-RubyWebTicTacToe/views'
use Rack::Static, :urls => ['css'], :root => '../../Apprenticeship-RubyWebTicTacToe/public/css'
use Rack::Session::Cookie,
  :key => 'rack.session',
  :path => '/',
  :expire_after => 14400, # In seconds
  :secret => 'secret_stuff'
run RackRouter
