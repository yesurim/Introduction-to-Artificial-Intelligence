data = [1 2 3; 4 5 6; 7 8 9];

% 2행 3열 데이터 가져오기
data(2, 3)

% 3행 1열 데이터 가져오기
data(3, 1)

% 2행의 모든 데이터 가져오기
data(2, :)

% 3열의 모든 데이터 가져오기
data(:, 3)

% 2행의 1, 2열 데이터 가져오기
data(2, 1:2)

%%%%%%%%%%%%%%

% 1부터 10까지 1씩 증가하는 변수 만들기
a = 1:1:10

% 10에서 1까지 1씩 감소하는 변수 만들기
a = 10:-1:1

% 몇개인지 확인하기
length(a)

%%%%%%%%%%%%%%%

% 0이 10개인 변수 만들기
a = zeros(1, 10)
a = zeros(10, 1)

% 1이이 10개인 변수 만들기
a = ones(1, 10)
a = ones(10, 1)

% 1의 개수가 a의 길이와 같은 변수 만들기
a = 1:3.5:100
b = ones(1, length(a))

%%%%%%%%%%%%%%%
x = 1:1:10;
y = 2*x -1;

figure;
plot(x, y);

figure;
stem(x, y);

figure;
bar(x, y);

%%%%%%%%%%%%

x = 1:1:10;
y = 2*x -1;

figure;
subplot(3, 1, 1); plot(x, y);
subplot(3, 1, 2); stem(x, y);
subplot(3, 1, 3); bar(x, y);

figure;
subplot(1, 3, 1); plot(x, y);
subplot(1, 3, 2); stem(x, y);
subplot(1, 3, 3); bar(x, y);

%%%%%%%%%%%%

% 특정 조건에 맞는 데이터 가져오기
x = 1:2:10;
i = find(x>5) % x들 중 5보다 큰 값의 위치를 가져와라
y = x(i)

%%%%%%%%%%%%
clear all; close all; clc;

% 각 행을 세미 콜론으로 분리
A = [1 2 3; 3 5 6];
B = [-1 -2; -3 -4; -5 -6];
C = [1 2 3; 4 5 6; 7 8 1];
D = [7 8 1; 1 2 3; 4 5 6];

% 또는 행별로 데이터 넣기
A =[];
A(1, :) = [1 2 3];
A(2, :) = [3 4 5];

B = [];
B(1, :) = [-1 -2];
B(2, :) = [-3 -4];
B(3, :) = [-5 -6];

C = [];
C(1, :) = [1 2 3];
C(2, :) = [4 5 6];
C(3, :) = [7 8 1];

D = [];
D(1, :) = [7 8 1];
D(2, :) = [1 2 3];
D(3, :) = [4 5 6];

%%%%%%%%%%%%
% 행렬 연산
A*B  %(2x3) (3x2)
Y = B*C %(3x2) (3x3)

% 전치행렬과 덧셈
A + B % 2x3, 3x2
A + transpose(B)
A + B'

% 행렬식 계산(행과 열의 개수가 같은 정방행열에서만 계산 가능)
det(A)
det(C)

% 역행렬 계산
inv(A)
inv(C)
C^-1

%% 행렬 특성 CD != DC
C*D
D*C

% 행렬 특성 (CD)^-1 = D^-1 * C^-1
inv(D)*inv(C)
inv(C*D)

%%%%%%%%%%%%%%%
clear all; close all; clc;

% x데이터의 합, 평균을 구하는 코드
x = 1:1:10;

out1 = 0;
out2 = 0;

for k=1:1:length(x)
    out1 = out1 + x(k);
    out2 = out2 + x(k)/length(x);
end
out1
out2

% 내장함수 사용
out11 = sum(x)
out22 = mean(x)
out33 = std(x)

%%%%%%%%%%%%%%%

% x데이터 중 2의 배수, 3의 배수, 5의 배수의 합을 구하는 코드
out2 = 0;
out3 = 0;
out5 = 0;

out2_set = [];
out3_set = [];
out5_set = [];

x = 1:1:100;

for k=1:1:length(x)
    if mod(x(k), 2)==0
        out2 = out2 + x(k);
        out2_set = [out2_set x(k)];
    elseif mod(x(k), 3) == 0
        out3 = out3 + x(k);
        out3_set = [out3_set x(k)];
    elseif mod(x(k), 5) == 0
        x(k)
        out5 = out5 + x(k);
        out5_set = [out5_set x(k)];
    end
end
out2
out3
out5

%%%%%%%%%%
x = 1:1:100;

idx2 = find(mod(x, 2)==0);
idx3 = find(mod(x, 3)==0);
idx4 = find(mod(x, 5)==0);

out22=sum(x(idx2));
out33=sum(x(idx3));
out55=sum(x(idx4));

%%%%%%%%%%%
clear all; close all; clc;

% x의 범위
x = 0:0.1:10;

m1 = 5;
s1 = 1;

y = (1/(s1*sqrt(2*pi))) * exp((-(x-m1).^2)/(2*(s1.^2)));
y = y/sum(y);

figure;
plot(x, y);