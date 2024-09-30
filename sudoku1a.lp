
% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Define the domain of numbers
number(1..4).

% Define the domain of rows and columns
row(1..4).
column(1..4).

% Include initial values
sudoku(X,Y,N) :- initial(X,Y,N).

% Generate a solution for empty cells
1 { sudoku(X,Y,N) : number(N) } 1 :- row(X), column(Y), not initial(X,Y,_).

% Each number appears exactly once in each row
:- row(X), number(N), #count{ Y : sudoku(X,Y,N) } != 1.

% Each number appears exactly once in each column
:- column(Y), number(N), #count{ X : sudoku(X,Y,N) } != 1.

% Show only sudoku facts
#show sudoku/3.



