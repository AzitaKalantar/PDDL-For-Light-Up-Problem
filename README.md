# PDDL-For-Light-Up-Problem

Setting of the game: In this exercise, your task it to model the Light Up puzzle12 in
PDDL. This game is based on a 2D grid consisting of black and white cells. White cells
can be lit up by placing light bulbs on the grid. Placing a light bulb at some coordinate
hx, yi lights up all white cells of the same column (x), and all white cells of the same row
(y), such that no black cell lies in between hx, yi and the cell, i.e., light propagation is
stopped by black cells. A light bulb may only be placed in a cell that is not lighted up by
another light bulb yet. Some black cells are associated with numbers. This number gives
the number of light bulbs that must be placed directly (horizontally or vertically) adjacent
to the black cell. For example, if the number is 0, no light bulb may be placed in a cell
adjacent to the black cell. If 1, exactly one light bulb may (and must) be placed to a cell
adjacent to the black cell. The goal is to light up all white cells while adhering to the
aforementioned constraints.
