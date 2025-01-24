# Chess

## Problems that I faced

1. To model **Board** class, I was using unicode characteres for chess squares and pieces. I started having trouble overlaying my chess pieces on chess squares. So I googled a lot and found that there is no way to overlay one unicode character over another. So I asked for [help](https://www.reddit.com/r/ruby/comments/1hyssvi/how_to_fix_chess_pieces_to_chess_board/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button).

2. Problem on how to display markers for all pieces.

3. Problem on how to display possible captures for a piece.

4. Problem on whether Pieces should track of their player or player should keep track of its set of pieces and color.


## Progress corresponding to roadblocks

1. I used **ANSI** codes to color the terminal for the chess square part. Now I can just color the terminal behind a chess piece.