
% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

% Define the grid
row(1..4).
col(1..4).
num(1..4).

% Generate a solution
1 { sudoku(X,Y,N) : num(N) } 1 :- row(X), col(Y).

% Each number appears once in each row
:- row(X), num(N), #count{ Y : sudoku(X,Y,N) } != 1.

% Each number appears once in each column
:- col(Y), num(N), #count{ X : sudoku(X,Y,N) } != 1.

#show sudoku/3.
