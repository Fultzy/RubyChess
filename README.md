

# Ruby chess!! created by Fultzy! :D
  Assignment for the Odin Project.
  - ruby-v: 2.6.0+
  - RSpec-v: 3.10

  Running this game:
  - make sure you have ruby v-2.6.2 installed
  - run `git clone git@github.com:Fultzy/RubyChess.git`
  - then run `ruby rubychess.rb` to play the game!
  - it should be that easy!

  Next stages:
  - Save and Load games has yet to be implemented.
  - implement more elegant answer to new board creation
  - check and checkmate functions need to be created

  Issues:

    pieces & movement
    - something about diagonals sometimes blows up board view
    - queen not responding to vertical ascending requests
    - pawn cannot attack diagonally
      - sometimes takes pieces but doesn't move
    - pieces can jump over each other
    - diagonal bishop movement left and up breaks `piece_line#icon` for nil
    - sometimes valid bishop movements do not move, then skip turn
      - `c1 to e3`

    input & feedback
    - needs feedback after invalid input and why
    - after `illegal move` is printed it skips players turn
