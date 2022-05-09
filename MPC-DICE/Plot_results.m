

%in the single runs

Yedoma_triggering_year_single=SaveData(2).years((SaveData(1).Yedoma_triggered(2:end)~=SaveData(1).Yedoma_triggered(1:end-1)));
Amazon_triggering_year_single=SaveData(2).years((SaveData(1).Amazon_triggered(2:end)~=SaveData(1).Amazon_triggered(1:end-1)));
Greenland_triggering_year_single=SaveData(2).years((SaveData(1).Greenland_triggered(2:end)~=SaveData(1).Greenland_triggered(1:end-1)));



figure(1)
    hold on
    stem(SaveData(1).years,SaveData(4).TATM,'LineStyle','none')
    stem(SaveData(1).years,SaveData(5).TATM,'LineStyle','none')
    %annotation('textarrow',[0.405 0.405],[0.78 0.68],'String','Yedoma triggering point','Color','red')
    legend('With the Greenland tipping point','Base run')
    xlabel('Years')
    ylabel('Temperature change in °C')
    hold off



  
figure(2)
    hold on
    stem(SaveData(1).years,SaveData(4).MATM,'LineStyle','none')
    stem(SaveData(1).years,SaveData(5).MATM,'LineStyle','none')
    legend('With the Greenland tipping point','Base run')
    %annotation('textarrow',[0.355 0.355],[0.52 0.62],'String',['Amazon' newline...
        %'Triggering point'],'Color','red')
    xlabel('Years')
    ylabel('Atmospheric carbon concentration in GtC')
    hold off



figure(3)
hold on
    subplot(1,2,1),
    stem(SaveData(1).years(1:end-1),SaveData(4).miu,'LineStyle','none')
    title('With the Greenland tipping point')
    annotation('textarrow',[0.28 0.215],[0.37 0.37],'String',['Greenland' newline ...
        'Triggering point'],'Color','red')
    subplot(1,2,2),
    stem(SaveData(1).years(1:end-1),SaveData(5).miu,'LineStyle','none')
    title('Base run')
    ylabel('Emission mitigation rate mu')
    hold off

figure(4)
    subplot(1,2,1),
    stem(SaveData(1).years(1:end-1),SaveData(4).Savings_Rate,'LineStyle','none')
    title('With the Greenland tipping point')
    annotation('textarrow',[0.27 0.21],[0.84 0.8],'String',['Greenland' newline...
        'Triggering point'],'Color','red')
    subplot(1,2,2),
    stem(SaveData(1).years(1:end-1),SaveData(5).Savings_Rate,'LineStyle','none')
    title('Base run')
    ylabel('Savings Rate')
hold off


figure(5)
    hold on
    stem(SaveData(1).years(1:end-1),SaveData(4).SCC,'LineStyle','none')
    stem(SaveData(1).years(1:end-1),SaveData(5).SCC,'LineStyle','none')
    legend('With the Greenland tipping point','Base run')
    xlabel('Years')
    ylabel('Social cost of carbon in 2010 US $')
    hold off