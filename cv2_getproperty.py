import cv2

cap = cv2.VideoCapture('WIN_20250525_09_21_37_Pro.mp4')

# FPSの取得
fps = cap.get(cv2.CAP_PROP_FPS)
print(f"FPS: {fps:.2f}")

# 解像度の取得
width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
print(f"Resolution: {width} x {height}")

cap.release()

# cv2.CAP_PROP_... で取得できる他のプロパティ
# ・cv2.CAP_PROP_FRAME_COUNT：全フレーム数
# ・cv2.CAP_PROP_POS_FRAMES：現在のフレーム番号
# ・cv2.CAP_PROP_POS_MSEC：現在の再生位置（ミリ秒）