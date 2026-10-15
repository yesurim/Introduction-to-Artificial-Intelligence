clear all; close all; clc;

load fisheriris.mat;

% sepal length, width  이용
setdata = [];
setdata = meas(:,1:2);

% 매트랩 내부함수. 출력: mat_label: 그룹 할당 결과, mat_CP: 각 그룹의 중심 좌표
[mat_label, mat_CP] = kmeans(setdata, 3, 'Start', setdata(1:3,:));

%%
grp = 3; % k = 3;
class = [1 2 3];

% 수업시간에 구현한 군집화 부분을 my_kmeans 함수로 대체
[Final_label, my_CP] = my_kmeans_202210776(setdata, grp, class);

figure;
subplot(311); plot(mat_label); axis tight;
subplot(312); plot(Final_label); axis tight;
subplot(313); plot(mat_label-Final_label); axis tight;

my_CP
mat_CP

%% petal length, width 이용
setdata = [];
setdata = meas(:,3:4);

% 매트랩 내장함수와 동일한 초기 중심좌표를 사용하여 비교
[mat_label, mat_CP] = kmeans(setdata, 3, 'Start', setdata(1:3,:));

[Final_label, my_CP] = my_kmeans_202210776(setdata, grp, class);

figure;
subplot(311); plot(mat_label); axis tight;
subplot(312); plot(Final_label); axis tight;
subplot(313); plot(mat_label-Final_label); axis tight;

my_CP
mat_CP
