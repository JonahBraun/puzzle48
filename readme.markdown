A solution solver for the jigsaw puzzle "The Ultimate Puzzle - 48 Puzzles in 1".  This solver discovers 8322 solutions, a small number more are likely to exist.

### Overview

This puzzle contains 16 different pieces which the packaging claims can be put together in 48 different ways.  It's acutally quite challenging to find even one solution.  This program was written for a code golf challenge at [Fluid](www.fluid.com).  It uses pure sql to find solutions, and contains a one sql statement solver.  It only finds solutions for the set where all the orientation of all pieces are the same, so there are likely further solutions existing where the edge pieces have a non conformal orientation.

### Usage

The SQL files are written to be sent to sqlite3 directly, eg: `cat 48-one_statement.sql | sqlite3`

1. `48-analyze.sql` - for ease of understanding and performance
1. `48-one_statement.sql` - same solution but only using one sql statement!
1. `48-both.sql` - contains code from the two previous styles for demonstration purposes
1. `results` - All 8322 solutions as found by the solver

### Understanding the output

A solution line looks like:

`4 ⊻ + ∧ ⊻ 16 ⊻ ⬣ ⊻ + 12 ⊻ ∧ ∧ ⬣ 15 ⬣ ⬣ ⬣ ∧ 13 ∧ ⬣ ⬣ ∧ 2 ⊻ ⊻ + ⬣ 3 ∧ ∧ ⬣ ⊻ 6 ⬣ ⊻ ⊻ ∧ 10 ⬣ + ∧ ∧ 1 + ⬣ ⬣ + 8 ⬣ ∧ + ⬣ 9 ⊻ ⊻ + ∧ 7 ∧ + ⊻ + 11 ⬣ ⊻ ⬣ + 14 + ⬣ ⬣ ⊻ 5 + ∧ ∧ ⬣`

All 16 pieces of the puzzle are shown in one line.  The pieces are ordered left to right, top to bottom – so it begins with the top left and finishes with the bottom right.  Each piece is preceeded by it's id, followed by the four join shapes in clockwise order starting with the top.  The piece IDs can be mapped to the below image from the actual puzzle, with 1 at the top left and 16 at the bottom right.

![Piece Map](https://raw.githubusercontent.com/JonahBraun/puzzle48/master/piece_map.jpeg)

Here is a sample solution:

![Sample Solution](https://raw.githubusercontent.com/JonahBraun/puzzle48/master/sample_solution.jpeg)
