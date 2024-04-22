%% 识别杆塔类型、判断是直线还是耐张型
% 识别杆塔类型
clc;clear
DataPath = '.\Data\电塔序号1\';
addpath(genpath('.\Functions'))

% 读取杆塔号
TowerIds = getTowerID(DataPath);
TowerNum = size(TowerIds,1);
Types = zeros(TowerNum,2);
% 判断杆塔类型并识别耐张塔
for i = 1:TowerNum
    TowerID = TowerIds(i,:);
    % 读取电力线和杆塔点云
    TowerPts = importdata([DataPath,TowerID,'杆塔.txt']);
    LinePts = importdata([DataPath,TowerID,'电力线.txt']);
    % 识别类型
    Types(i,1) = str2double(TowerID);
    Types(i,2) = TypeDetect(TowerPts,LinePts);
end
writematrix(Types,'TowerTypes.txt')
