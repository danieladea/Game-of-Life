%Daniel Adea
%204999515
%The Game of Life
%This script simulates the game of life with pseudorandom starting cells in
%a grid you can alter the dimensions of

%clear workspace
clear all; clc; close all;

%shuffle 
rng('shuffle');

%initialize conditions as given
num_rows= 150;
num_cols = 200;
num_timesteps = 300;
N = num_timesteps + 1;

%initialize arrays to save time in memory allocation
population = zeros(1, N);
time = linspace(0, num_timesteps, N);
a = zeros(num_rows, num_cols);
a_new = a;
 
%fill in array randomly
for i=1:num_rows
    for j = 1:num_cols
        if rand <= .1
            a(i , j) = 1;
        else
            a(i,j) = 0;
        end
    end
end

%pause print initial figure
imagesc(a);
pause;
 
%set initial population
population(1) = sum(sum(a));

%for loop for every time step
for k = 1:num_timesteps
    %loop through each array element
    for i=1:num_rows
        for j = 1:num_cols
            %set directions, including exceptions
            N = i-1;
            S = i+1;
            E = j+1;
            W = j-1;
            if i == 1
                N = num_rows;
            end
            if i == num_rows
                S = 1;
            end
            if j == 1
                W = num_cols;
            end 
            if j == num_cols
                E = 1;
            end
            %calculate what happens to cell
            total = a(N,E)+ a(N,j) + a(N,W) + a(i,E) + a(i,W) + a(S,E) + a(S,j) + a(S,W);
            if a(i,j) == 1
                if total == 2 || total == 3
                    a_new(i,j) = 1;
                else
                    a_new(i,j) = 0;
                end
            else
                if total == 3
                    a_new(i,j) = 1;
                else
                    a_new(i,j) = 0;
                end 
            end
        end
    end
%update board of life    
a = a_new;

%update population
population(1+k) = sum(sum(a));

%print image
figure(1)
imagesc(a);
drawnow;
end

figure(2)
plot(time, population);



          
            
            
        
