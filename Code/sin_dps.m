clc;
clear all;
x =[-40:0.5:40];
no = input('Enter the wave you want\n1 : Sine Wave \n2 : Cos Wave\n3 : Unit Impulse Function\n4 : Unit Step Function\n5 : Ramp function\n6 : Exponential function\n');


switch no
    case 1
        z = input('Input the type of signal\n1 : Continuous \n2 : Discrete\n');
        amp = input("Enter the amplitude of the signal: ");
        fc = input("Enter the frequency of the signal: ");
        y = amp*sin(2*pi*x*1/fc);
        %subplot(2,1,1);
        if z ==1
            plot(x,y);grid on;
            xlabel('Time t');
            ylabel('x(t)');
            grid on;
            title('Continuous Sine Signal');
        elseif z ==2
            stem(x,y);grid on;
            xlabel('Time n');
            ylabel('x[n]');
            grid on;
            title('Discrete Sine Signal');
        else
            display("Wrong input for type of signal");
        end
            
    case 2
        z = input('Input the type of signal\n1 : Continuous \n2 : Discrete\n');
        amp = input("Enter the amplitude of the signal: ");
        fc = input("Enter the frequency of the signal: ");
        y = amp*cos(2*pi*x*1/fc);
        if z ==1
            plot(x,y);grid on;
            xlabel('Time t');
            ylabel('x(t)');
            grid on;
            title('Continuous Cos Signal');
        elseif z ==2
            stem(x,y);grid on;
            xlabel('Time n');
            ylabel('x[n]');
            grid on;
            title('Discrete Cos Signal');
        else
            display("Wrong input for type of signal");
        end

    case 3
        
        N=15;
        x=-N:1:N;
        y=[zeros(1,N),ones(1,1),zeros(1,N)];
        z = input('Input the type of signal\n1 : Continuous \n2 : Discrete\n');
        if z ==1
            plot(x,y);grid on;
            xlabel('Time t');
            ylabel('x(t)');
            grid on;
            title('Continuous Unit Impulse Signal ');
        elseif z ==2
            stem(x,y);grid on ;
            xlabel('Time n');
            ylabel('x[n]');
            grid on;
            title('Discrete Unit Impulse Signal');
        else
            display("Wrong input for type of signal");
        end
    case 4
        N=20;
        x=0:1:N-1;
        y=ones(1,N);
        z = input('Input the type of signal\n1 : Continuous \n2 : Discrete\n');
        if z ==1
            plot(x,y); grid on;
            plot(x,y);grid on;
            xlabel('Time t');
            ylabel('x(t)');
            grid on;
            title('Continuous Unit Impulse Signal');
        elseif z ==2
            stem(x,y);grid on;
            xlabel('Time n');
            ylabel('x[n]');
            grid on;
            title('Discrete Unit Impulse Signal');
        else
            display("Wrong input for type of signal");
        end
        
        
    case 5
        N=20;
        x=-N:1:N-1;
        amp = input("Enter the amplitude of the signal: ");
        y=amp*x.*[x>=0];
        z = input('Input the type of signal\n1 : Continuous \n2 : Discrete\n');
        if z ==1
            plot(x,y); grid on;
            plot(x,y);grid on;
            xlabel('Time t');
            ylabel('x(t)');
            grid on;
            title('Continuous Ramp Signal');
        elseif z ==2
            stem(x,y);grid on;
            xlabel('Time n');
            ylabel('x[n]');
            grid on;
            title('Discrete Ramp Signal');
        else
            display("Wrong input for type of signal");
        end
    case 6
        N=10;
        x=0:0.5:N;
        amp = input("Enter the amplitude of the signal: ");
        y=exp(amp*x);
        z = input('Input the type of signal\n1 : Continuous \n2 : Discrete\n');
        if z ==1
            plot(x,y); grid on;
             plot(x,y); grid on;
            plot(x,y);grid on;
            xlabel('Time t');
            ylabel('x(t)');
            grid on;
            title('Continuous Exponential Signal');
        elseif z ==2
            stem(x,y);grid on;
            xlabel('Time n');
            ylabel('x[n]');
            grid on;
            title('Discrete Exponential Signal');
        else
            display("Wrong input for type of signal");
        end
        
    otherwise
        disp('Wrong input');  
end

%% 
clc;
clear all;
t = -5:0.01:5;
t1 = -5:0.1:5;

Graph1_continuous = unit_step(t)+unit_step(t-1)-unit_step(t-2)-unit_step(t-3);
Graph1_discrete = unit_step(t1)+unit_step(t1-1)-unit_step(t1-2)-unit_step(t1-3);

z = input('Input the type of signal\n1 : Continuous \n2 : Discrete\n');
if z==1 
    plot(t, Graph1_continuous)
    xlabel('Time t');
    ylabel('x(t)');
    grid on;
    title('Continuous Time Customized Signal 1');
else if z ==2 
    stem(t1, Graph1_discrete)
    xlabel('Time n');
    ylabel('x[n]');
    grid on;
    title('Discrete Time Customized Signal 1');
    end
end

%%
clc;
clear all;
t = -5:0.01:5;
t1 = -5:0.1:5;

Graph2_continuous = -unit_step(t+3) + 2*unit_step(t+2)+ramp(t+1)-...
    2*ramp(t)+ramp(t-1)-2*unit_step(t-2)+unit_step(t-3);
Graph2_discrete = -unit_step(t1+3) + 2*unit_step(t1+2)+ramp(t1+1)-...
    2*ramp(t1)+ramp(t1-1)-2*unit_step(t1-2)+unit_step(t1-3);
z = input('Input the type of signal\n1 : Continuous \n2 : Discrete\n');
if z==1
    plot(t, Graph2_continuous)
    xlabel('Time t');
    ylabel('x(t)');
    grid on;
    title('Continuous Time Customized Signal 2');
    ylim([-3,3])
else if z ==2
    stem(t1, Graph2_discrete)
    xlabel('Time n');
    ylabel('x[n]');
    grid on;
    title('Discrete Time Customized Signal 2');
    ylim([-3,3])
    end
end
    


function out = unit_step(t)
x1 = 1;
x0 = 0;
out = x1.*(t>=0) + x0.*(t<0);
end

function out = ramp(t)
x1=t;
x0=0;
out = x1.*(t>=0) + x0.*(t<0);
end

        
