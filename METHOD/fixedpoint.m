function [x, out] = fixedpoint(FunFcnIn, x0, params)
% 
%  To find a solution to f(x) = 0 given the continuous function
%  f and initial guess x0
%  opposite signs:
% 
%  INPUT:  function f(x) defined by function handle FunFcnIn, 
%          initial guess x0, 
%           tolerence params.tol, max # of iterations = params.MaxIt
%  OUTPUT: root x, and data structure out. 
%          The success flag out.flg, is 0 for successful
%          execution and non-zero otherwise. out.it is the number
%          of iterations to reach within tolerance.
%
% Written by Ming Gu for Math128A, Fall 2010

TOL = params.tol;
NO  = params.MaxIt;
[FunFcn,msg] = fcnchk(FunFcnIn,0);
if ~isempty(msg)
    error('InvalidFUN',msg);
end

It = 1;
x  = x0;
while (It <= NO)
   fx = FunFcn(x);
   if (abs(fx-x) <=TOL)
      x = fx;
      out.flg = 0;
      out.it  = It;
      return;
   end
   x  = fx;
   It = It + 1;
end
out.flg =1;
out.it = NO;
