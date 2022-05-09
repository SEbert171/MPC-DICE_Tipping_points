%Script to call the MPC-DICE with different values for the tipping points
%parameters

clc
clear all
close all

% import casadi name space
import casadi.*

Yedoma_threshold=4;         %indexing starts with 1
Yedoma_impact=12;%GtC emitted during a 5 year time span
Amazon_threshold=3.5;
Amazon_impact=44.85;%GtC emitted once
Greenland_threshold=2.5;
Greenland_impact=0.05;%Reduction of global economic output

%all tipping points
SaveData(1)=MPCDICE_casadi_tipping_points(Yedoma_threshold, Yedoma_impact, Amazon_threshold, Amazon_impact, Greenland_threshold, Greenland_impact);
%only Yedoma
SaveData(2)=MPCDICE_casadi_tipping_points(Yedoma_threshold,Yedoma_impact,10,0,10,0);
%only Amazon
SaveData(3)=MPCDICE_casadi_tipping_points(10,0, Amazon_threshold, Amazon_impact, 10, 0);
%only Greenland
SaveData(4)=MPCDICE_casadi_tipping_points(10,0, 10, 0, Greenland_threshold, Greenland_impact);
%no tipping point
SaveData(5)=MPCDICE_casadi_tipping_points(10,0, 10, 0, 10, 0);



save('Results_v2016_with_tipping_points',"SaveData")



%in the single runs

Yedoma_triggering_year_single=SaveData(2).years((SaveData(1).Yedoma_triggered(2:end)~=SaveData(1).Yedoma_triggered(1:end-1)));
Amazon_triggering_year_single=SaveData(2).years((SaveData(1).Amazon_triggered(2:end)~=SaveData(1).Amazon_triggered(1:end-1)));
Greenland_triggering_year_single=SaveData(2).years((SaveData(1).Greenland_triggered(2:end)~=SaveData(1).Greenland_triggered(1:end-1)));



figure(1)
    hold on
    stem(SaveData(1).years,SaveData(1).TATM,'LineStyle','none')
    stem(SaveData(1).years,SaveData(5).TATM,'LineStyle','none')
    legend('With all tipping points','Base run')
    xlabel('Years')
    ylabel('Temperature change in °C')
    hold off



  
figure(2)
    hold on
    stem(SaveData(1).years,SaveData(1).MATM,'LineStyle','none')
    stem(SaveData(1).years,SaveData(5).MATM,'LineStyle','none')
    legend('With all tipping points','Base run')
    xlabel('Years')
    ylabel('Atmospheric carbon concentration in GtC')
    hold off



figure(3)
hold on
    subplot(1,2,1),
    stem(SaveData(1).years(1:end-1),SaveData(1).miu,'LineStyle','none')
    title('With all tipping points')
    subplot(1,2,2),
    stem(SaveData(1).years(1:end-1),SaveData(5).miu,'LineStyle','none')
    title('Base run')
    ylabel('Emission mitigation rate mu')
    hold off

figure(4)
    subplot(1,2,1),
    stem(SaveData(1).years(1:end-1),SaveData(1).Savings_Rate,'LineStyle','none')
    title('With all tipping points')
    subplot(1,2,2),
    stem(SaveData(1).years(1:end-1),SaveData(5).Savings_Rate,'LineStyle','none')
    title('Base run')
    ylabel('Savings Rate')
hold off


figure(5)
    hold on
    stem(SaveData(1).years(1:end-1),SaveData(1).SCC,'LineStyle','none')
    stem(SaveData(1).years(1:end-1),SaveData(5).SCC,'LineStyle','none')
    legend('With all tipping points','Base run')
    xlabel('Years')
    ylabel('Social cost of carbon in 2010 US $')
    hold off

