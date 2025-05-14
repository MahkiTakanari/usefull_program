% DAQセッション作成（オンデマンドモード）
s = daq("ni");
addinput(s, "Dev3", "port0/line0", "Digital");

disp("スイッチ状態を監視中（10秒間）...");
tic;

while toc < 10
    val = read(s);        % val は timetable 型
    state = val{:,1};     % デジタル値だけ取り出す（logical型）
    if state == 1
        fprintf("🟢 スイッチが押されました！ 時刻: %.3f 秒\n", toc);
        break;
    end
    pause(0.01);  % 10msごとにチェック
end

disp("監視終了");
