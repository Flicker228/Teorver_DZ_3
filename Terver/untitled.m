X = [67 65 65 62 63 66 68 71 68 64 61 63 60 71 64 64 69 59 65 64 64 65 64 66 64 62 64 68 65 67 67 67 67 71 68 71 69 65 67 62 68 70 67 64 65 65 64 61 66 67 61 65 64 70 64 68 60 61 68 65 60 67 65 63 65 65 63 64 66 62 65 65 68 61 65 61 64 62 68 69 70 71 70 69 70 71 65 71 70 71 69 70 64 71 70 70 68 70 62 66 69 70 71 69 72 73 74 73 70 63 67 65 63 68 70];

% Пункт 1

X = sort(X);
Z = zeros(2, length(X));
j = 1;
i = 1;
Z(1, j) = X(1);

while i <= length(X)
    if X(i) == Z(1, j)
        Z(2, j) = Z(2, j) + 1;
        i = i + 1;
    else
        j = j + 1;
        Z(1, j) = X(i);
    end
end

i = 1;

while i <= length(Z)
    if Z(:,i) == zeros(size(Z(:,i)))
        Z(:,i) = [];
    else
        i = i + 1;
    end  
end

delta = (max(X) - min(X))/5;

J = zeros(2, 5);
prob_values = min(X):max(X);

J(1, :) = min(X)+delta/2 : delta : max(X) - delta/2;

J(2, 1) = sum(Z(2, 1:delta));
J(2, 2) = sum(Z(2, delta + 1:delta + 3));
J(2, 3) = sum(Z(2, 2*delta + 1:2*delta + 3));
J(2, 4) = sum(Z(2, 3*delta + 1:3*delta + 3));
J(2, 5) = sum(Z(2, 4*delta + 1:4*delta + 3));

% Пункт 2

sample_mean = sum(X)/length(X);

unbiased_sample_variance = (1/(length(X) - 1))*(sum((X - sample_mean).*(X - sample_mean)));

% Пункт 3
figure
bar(J(1, :), J(2,:)/length(X), 1)
title('Гистограмма')
J
