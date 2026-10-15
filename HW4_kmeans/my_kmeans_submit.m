function [Final_label, my_CP] = my_kmeans_202210776(setdata, grp, class)
% 입력: setdata(데이터), grp(그룹 수), class(클래스 번호 배열)
% 출력: Final_label(최종 그룹 할당), my_CP(최종 중심 좌표)

% [0단계: 초기 객체 선정]
% 편의상 1~3번째 데이터를 초기 값으로 하겠음 (거리들을 모두 계산하고 가장 거리가 먼 3점으로 하면 아마도 아래 while문의 동작 횟수가 줄어 들 것)
% (k가 3이니, 3개의 중심좌표가 나와야 하고, 입력 데이터 속성이 두 개이므로 중심좌표는 2차원)
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
% [2, 3단계, 1단계 반복: 군집 중심좌표 산출 & 수렴 조건 점검 / 객체 군집 배정
% 군집 중심좌표 산출 /객체 군집 배정 를 반복해야 함. 언제까지? 수렴 조건에 수렴할 때까지. 
% 수렴조건의 만족은 for문으로 확인이 어려우므로 while문으로
while(chk)
    loop = loop + 1;
    loop
    for kk=1:1:grp
        idx = find(my_label == class(kk)); % kk 그룹에 할당된 데이터 가져오기
        tmp_data = setdata(idx,:);

        % kk 그룹에 할당된 데이터를 이용하여 중심 좌표를 계산
        if isempty(idx)
            % 동일한 초기 중심좌표 등으로 빈 그룹이 발생한 경우 처리
            % 기존 중심좌표들과 가장 멀리 떨어진 데이터를 새 중심으로 사용
            min_dist = zeros(length(setdata), 1);
            for ii=1:1:length(setdata)
                udist = zeros(grp, 1);
                for jj=1:1:grp
                    udist(jj,1) = norm(setdata(ii,:) - my_CP(jj,:));
                end
                min_dist(ii,1) = min(udist);
            end
            [sv, si] = sort(min_dist, 'descend');
            my_CP(kk,:) = setdata(si(1),:);
        else
            my_CP(kk,:) = mean(tmp_data);
        end
    end

    % 새로운 중심좌표를 이용하여, 데이터를 재할당
    my_label_new = [];
    for kk=1:1:length(setdata)
        tmp_set = setdata(kk,:);

        udist = zeros(grp, 1);
        for jj=1:1:grp
            udist(jj,1) = norm(tmp_set - my_CP(jj, :));
        end

        [sv, si] = sort(udist, 'ascend');

        my_label_new(kk,1) = class(si(1));
    end

    % 1단계의 결과와 2단계의 결과가 같은지 평가
    idx = find(my_label_new ~= my_label);

    % 이전 할당 결과와 지금 할당 결과가 같으면 while문 종료
    % 그렇지 않으면, 위 과정을 반복
    if length(idx) == 0
        chk = 0;
        Final_label = my_label_new;
        break;
    else
        my_label = my_label_new;
    end
end

end
