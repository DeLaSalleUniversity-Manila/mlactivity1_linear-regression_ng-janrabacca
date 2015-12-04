    x = load('Hours.dat');
    y = load('Scores.dat');
    plot(x,y,'o');
    xlabel('Hours of Studying') 
    ylabel('Score in Examination')
    hold on;
    m = length(y); 
    x = [ones(m,1), x];
    theta=zeros(2,1);
    iterations = 1500;
    a = 0.02; 
    theta = theta - (a * (1/m) * x' * (x * theta-y));
    theta=zeros(2,1);
    for i=1:iterations
      theta = theta - (a * (1/m) * x' * (x * theta-y));
     end
     plot(x(:,2),x*theta,'-');
    c = 5.5*theta(2) + theta(1);
    d = 8*theta(2) + theta(1);
    hold off;
    J-vals=zeros(100,100);
    theta0_vals = linspace(-3,3,100);
    theta1_vals = linspace(-1,1,100);
    for i=1:length(theta0_vals)
    for j=1:length(theta1_vals)
    t = [theta0_vals(i), theta1_vals(j)];
    J_vals(i,j) = (1/(2*m))*sum((x * t' - y).^2);
    end
    end
    J_vals = J_vals';
    surf(theta0_vals,theta1_vals,J_vals);
    xlabel('\theta_0');
    ylabel('\theta_1');
    
    
    