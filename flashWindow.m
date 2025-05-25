% t_start = tic;
% 
% fig = figure('Color', 'black', 'MenuBar', 'none', ...
%              'ToolBar', 'none', 'NumberTitle', 'off', ...
%              'Name', 'Flash', 'Position', [500, 500, 300, 300]);
% t1 = toc(t_start);
% fprintf("🖼 figure表示まで: %.4f sec\n", t1);
% 
% drawnow;
% t2 = toc(t_start);
% fprintf("🔄 drawnowまで: %.4f sec\n", t2);
% 
% pause(0.2);
% t3 = toc(t_start);
% fprintf("⏸ pause終了まで: %.4f sec\n", t3);
% 
% close(fig);
% t4 = toc(t_start);
% fprintf("❌ closeまで: %.4f sec\n", t4);



%/////////////////////////////////////////////////////////////////////////


t0 = tic;

% === 初期黒画面 ===
fig = figure('Color', 'black', ...
             'MenuBar', 'none', ...
             'ToolBar', 'none', ...
             'NumberTitle', 'off', ...
             'Name', 'Flash', ...
             'Position', [100, 300, 1000, 1000]);
drawnow;
pause(0.2);
fprintf("Step 1 (initial black)    : %.4f sec\n", toc(t0));

% === 白1回目 ===
fig.Color = 'white';
drawnow;
pause(0.2);
fprintf("Step 2 (1st white)         : %.4f sec\n", toc(t0));

% === 黒 ===
fig.Color = 'black';
drawnow;
pause(0.2);
fprintf("Step 3 (black)             : %.4f sec\n", toc(t0));

% === 白2回目（明転） ===
fig.Color = 'white';
drawnow;
pause(0.2);
fprintf("Step 4 (2nd white - flash) : %.4f sec\n", toc(t0));

% % === 黒に戻す ===
% fig.Color = 'black';
% drawnow;
% pause(0.2);
% fprintf("Step 5 (final black)       : %.4f sec\n", toc(t0));

% === 閉じる ===
close(fig);
fprintf("Step 6 (close)             : %.4f sec\n", toc(t0));
