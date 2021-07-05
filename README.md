

# Ruby chess!! created by Fultzy! :D
  Assignment for the Odin Project. GUI coming soon!!
  - ruby-v: 2.6.2
  - RSpec-v: 3.10
  - ruby2d-v: 0.9.5


# Running this game:
  - make sure you have ruby v-2.6.2 installed
  - run `git clone git@github.com:Fultzy/RubyChess.git`
  - then run `ruby RubyChess/rubychess.rb` to play the game!
  - it should be that easy!

# Up next:
  `rubychess.rb` calls commands to run the game
  `gamestate.rb` controls all game flow functions
  `pieces.rb` contains all piece requirements
  `window.rb` controls 2d window

# `Each piece` should:
  - be able to find its next moves
  - save its new location if moved
  - know how many times its been moved
  - link to their image? (black & white)
  - have a value

# `Board` should:
  - a new board is created with all pieces
  - be able to fetch all piece locations
  - be able to display a pieces legal moves/attacks
  - be able to show this information to `window.rb`
  - if a piece is taken is moved to graveyard?

# Testing should:
  - rake each piece for their specific tests
  - check piece placement on a new board
