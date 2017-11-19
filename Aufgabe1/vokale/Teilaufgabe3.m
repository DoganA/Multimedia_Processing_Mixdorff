clear all;
sampleRate = 16000;
%--------------------------------------------------------------------------
% Den Pfad ermitteln, um dort die Grafiken und Sound abzuspeichern: 
%currentfolder = pwd;
%outputfile = strcat(currentfolder, '\vokale\');
da_a_file = strcat('dalkan_a');
da_i_file = strcat('dalkan_i');
kd_a_file = strcat('krawat_a');
kd_i_file = strcat('krawat_i');
rk_a_file = strcat('rkalaslioglu_a');
rk_i_file = strcat('rkalaslioglu_i');
%rk_i_file = strcat(outputfile, 'rkalaslioglu_i');

sounds_list = {da_a_file, da_i_file, rk_a_file, rk_i_file, kd_a_file, kd_i_file};
framelength_list = [50 100 500 1000];

for i = 1:numel(sounds_list)
    current_file = sounds_list{i};
    current_sound = wavread(strcat(current_file, '.wav'));
    hFig = figure(i);
    set(hFig, 'Position', [0 0 800 1000])
    for j = 1:numel(framelength_list)
        current_frame_length = framelength_list(j);
        
        % do fourier transformation
        ft_sound = fft(current_sound, current_frame_length);
        
        % calculate delta_f and f
        delta_f = sampleRate/current_frame_length;
        f = (0:delta_f:sampleRate-delta_f);
        
        % plot in subplot
        subplot(numel(sounds_list),1,j)
        plot(f, abs(ft_sound));
        current_title = strcat('frame length= ', int2str(current_frame_length), ', delta f= ', int2str(delta_f));
        title(current_title);
        legend(current_file);
        xlabel('f_{Hz}');
        ylabel('x_t');
    end
    
    % save plot as jpg
    saveas(hFig, strcat('plot_13_', current_file), 'jpg');
    
    % close figure
    close(hFig);
    
end