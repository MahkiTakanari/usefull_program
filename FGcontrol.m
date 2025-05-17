% VISAリソース名（NI MAXで確認したものに合わせて書き換え）
visaAddress = "USB0::0x0D4A::0x000E::9113588::INSTR";  % 例：WF1974

% visadevオブジェクト作成
dev = visadev(visaAddress);

% 終端文字の設定（WF1974はLFが必要）
configureTerminator(dev, "LF");





% 通信確認（IDN確認）
writeline(dev, "*IDN?");
idn = readline(dev);
disp("識別応答: " + idn);

writeline(dev, '*RST')
fprintf("設定をリセット\n");

writeline(dev, ':OUTP:SCAL SIN,PFS');
fprintf("+FSのSIN波に設定\n");

writeline(dev, ':FREQ 100')
fprintf("周波数を設定\n");

writeline(dev, ':VOLT:AMPL 0.0')
fprintf("振幅を設定\n");

% 出力ON
writeline(dev, ":OUTP ON");

for amp = 0.5 : 0.5 : 5.0
    writeline(dev, ":PHAS 90");
    writeline(dev, sprintf(':VOLT:AMPL %.1f', amp));
    fprintf("振幅: %.1f V\n", amp);
    pause(1.025);  % 1秒待機
end

% 一時停止（1秒）
pause(3);

% 出力OFF
writeline(dev, ":OUTP OFF");





% オブジェクト削除（明示的に）
% clear dev

% delete(visadevfind);  % visadev方式のオブジェクトをすべて削除
% clear dev;            % オブジェクト変数をクリア

% devs = visadevfind;
% if ~isempty(devs)
%     delete(devs);
% end
% dev = visadev("USB0::0x0D4A::0x000E::9113588::0::INSTR");




