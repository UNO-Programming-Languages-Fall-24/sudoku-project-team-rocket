% Define the domain of numbers
number(1..4).

% Define the domain of rows and columns
row(1..4).
column(1..4).

% Generate a solution
1 { sudoku(X,Y,N) : number(N) } 1 :- row(X), column(Y).

% Each number appears exactly once in each row
:- row(X), number(N), #count{ Y : sudoku(X,Y,N) } != 1.

% Each number appears exactly once in each column
:- column(Y), number(N), #count{ X : sudoku(X,Y,N) } != 1.

% Define subgrids
subgrid(X,Y,1) :- X=1..2, Y=1..2.
subgrid(X,Y,2) :- X=1..2, Y=3..4.
subgrid(X,Y,3) :- X=3..4, Y=1..2.
subgrid(X,Y,4) :- X=3..4, Y=3..4.

% Include initial values if provided
sudoku(X,Y,N) :- initial(X,Y,N).

% Show sudoku and subgrid facts
#show sudoku/3.
#show subgrid/3.