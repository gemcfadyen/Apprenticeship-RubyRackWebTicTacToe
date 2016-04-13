# Apprenticeship-RubyRackWebTicTacToe


To play Tic Tac Toe through a browser, clone the repository into a folder
>> git clone git@github.com:gemcfadyen/Apprenticeship-RubyRackWebTicTacToe.git

Install dependencies using bundle
>> bundle install

Run unit tests using bundle
>> bundle exec rspec

Start the server locally
>> rackup

In your browser navigate to localhost:9292 (or whatever port is stated when your server starts)

You will be presented with the game to play!


When developing, if you wish to start your server on a different port use the command
>> rackup -I lib --port 4567 config.ru

To put it in re-run mode, install the rerun gem, and use the command
>> rerun -- rackup -I lib --port 4567 config.ru
