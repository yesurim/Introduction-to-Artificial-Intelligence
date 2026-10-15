clear all; close all; clc;

load fisheriris.mat;

% sepal length, width  이용
setdata = [];
setdata = meas(:,1:2);

% 매트랩 내부함수. 출력: mat_label: 그룹 할당 결과, mat_Cnt: 각 그룹의 중심 좌표
[mat_label, mat_CP] = kmeans(setdata, 3, 'Start', setdata(1:3,:));

%%
grp = 3; % k = 3;
class = [1 2 3];

% [0단계: 초기 객체 선언]
my_CP = setdata(1:grp,:); 

% [1단계: 객체 군집 배정]
my_label = [];
for kk=1:1:length(setdata)
    tmp_set = setdata(kk,:); % kk번째 데이터 가져오기

    % 각 중심좌표와 데이터 간의 유클리디안 거리를 계산
    udist = zeros(grp, 1);
    for jj=1:1:grp
        udist(jj,1) = norm(tmp_set - my_CP(jj, :));
    end

    % 현재 데이터와 중심좌표들의 거리를 오름차순으로 정렬
    [sv, si] = sort(udist, 'ascend');

    % 제일 앞에 있는 것이 거리가 제일 짧은 것. 그것의 그룹 ID로 현재 데이터를 할당하라 
    my_label(kk,1) = class(si(1));
end

Final_label = [];
chk = 1;
loop = 0;



% [출력 변수] = my_kmeans_학번(입력변수);

figure;
subplot(311); plot(mat_label); axis tight;
subplot(312); plot(Final_label); axis tight;
subplot(313); plot(mat_label-Final_label); axis tight;

my_CP
mat_CP
    
