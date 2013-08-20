# PhotoBingo

Photo Bingo is a bit of a mix between Apples to Apples,
and casual social games like Words with Friends. I envision it as a 
mobile game, though it is obviously not currently implemented as one.
A player selects (or makes) a theme, which contains a bunch of related
phrases. For example, the “Cars” theme may contain many different makes
and models of cars. He and his invited friends are each given a 4x4 grid,
populated with randomly selected and ordered cars.

They race to take pictures
of the corresponding cars, and upload them to the database. A picture must be
“approved” by the other players, to verify that it is, indeed, a picture of a
(for example) Lamborghini, rather than one of a Ford. This is done by vote.
When a player gets 4 approved pictures in a row, column, or diagonal, he is
declared the winner, and all boards become available to all players for perusal.

TODO:

[] Fix styling on themes#index. Entire button must be clickable.
[] Player names should only be buttons if game is over (this is at games#show)
[x] Make cell show page
[x] photos_controller new, create, show
[x] Make photo new page (or maybe cell#show)
[x] Make photo show page (or maybe cell#show)
[x] Get Paperclip working with Amazon
[x] notifications!
  [x] remember to add notification of quality "win", and make all boards available only if someone won
[x] end game!
  [x]Forbid lots of actions when game.end true (and hide relevant buttons)
  [x] allow checking other players' boards (and show buttons)
  [x] change notification "win"
  [x] check diagonal wins
[x] quit a game
  [x] alert before quit
  [x] ensure destruction of descendent objects
[x] add grid for Board template
[x] add indices for foreign keys
[x] Give error if try to submit photo with no image
 
[x] break cells/show.html.erb into a bunch of partials
~~[] link notifications to a board, instead of a subject AND a game~~

