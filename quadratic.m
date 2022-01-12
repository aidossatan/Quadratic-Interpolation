f=@(x) x + 1/x;
x0 = 0.1; 
x1 = 0.5; 
x2 = 5;

N = 100;
E = 0.00001;
iteration = 0;

for i = 1:N
    f0 = f(x0);
    f1 = f(x1);
    f2 = f(x2);
    
    u = f(x0)*(x1^2 - x2^2) + f(x1)*(x2^2 - x0^2) + f(x2)*(x0^2 - x1^2);
    l = 2*f(x0)*(x1-x2) + 2*f(x1)*(x2-x0) + 2*f(x2)*(x0-x1);
    x3 = u / l;
    f3 = f(x3);
    Err = abs(x3-x1);
    if Err < E
        break
    end
    disp(['X0: ' num2str(x0) ', f(X0): ' num2str(f0) ',|  X1: ' num2str(x1) ', f(X1): ' num2str(f1) ',|  X2: ' num2str(x2) ', f(X2): ' num2str(f2) ',| 2 X3: ' num2str(x3) ', f(X3): ' num2str(f3) ])
      
    if (x1 < x3) && (x3 < x2)
        x0 = x1;
        x1 = x3;
        x2 = x2;
    elseif (x0 < x3) && (x3 < x1)
        x0 = x0;
        x2 = x1;
        x1 = x3;
    end 
    iteration = iteration + 1;
  
end

disp(['Optimal X: ' num2str(x3) ', Optimal value: ' num2str(f3) ', Number of iteration: ' num2str(iteration)])