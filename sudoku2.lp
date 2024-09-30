% Define the domain of numbers
number(1..9).

% Define the domain of rows and columns
row(1..9).
column(1..9).

% Define subgrids
subgrid(X,Y,1) :- X=1..3, Y=1..3.
subgrid(X,Y,2) :- X=4..6, Y=1..3.
subgrid(X,Y,3) :- X=7..9, Y=1..3.

subgrid(X,Y,4) :- X=1..3, Y=4..6.
subgrid(X,Y,5) :- X=4..6, Y=4..6.
subgrid(X,Y,6) :- X=7..9, Y=4..6.

subgrid(X,Y,7) :- X=1..3, Y=7..9.
subgrid(X,Y,8) :- X=4..6, Y=7..9.
subgrid(X,Y,9) :- X=7..9, Y=7..9.


% Include initial values
sudoku(X,Y,N) :- initial(X,Y,N).

% Generate a solution for empty cells
1 { sudoku(X,Y,N) : number(N) } 1 :- row(X), column(Y), not initial(X,Y,_).


% Each number appears exactly once in each row
:- row(X), number(N), #count{ Y : sudoku(X,Y,N) } != 1.

% Each number appears exactly once in each column
:- column(Y), number(N), #count{ X : sudoku(X,Y,N) } != 1.

% Each number appears exactly once in each subgrid
:- subgrid(X,Y,G), number(N), #count{ X',Y' : sudoku(X',Y',N), subgrid(X',Y',G) } != 1.

% Ensure all cells are filled
:- row(X), column(Y), not sudoku(X,Y,_).

% Show only sudoku facts
#show sudoku/3.
