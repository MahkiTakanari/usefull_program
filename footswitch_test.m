daqObj = daq("ni");
addinput(daqObj, "Dev1", "ai0", "Voltage");
daqObj.Rate = 1000;

threshold = 2.0;

startTime = tic;
wasPressed = false;

while toc(startTime) < 10
    voltageTable = read(daqObj, seconds(0.01));  % 1サンプル読む
    v = voltageTable{1, 1};

    if v > threshold && ~wasPressed
        fprintf("✅ フットスイッチを踏んだよ！\n\n");
        wasPressed = true;
    elseif v <= threshold && wasPressed
        wasPressed = false;
    end
end

