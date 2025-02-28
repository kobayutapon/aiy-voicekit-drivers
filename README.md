Google AIY VoiceKitに付属のVoice BonnetをKernel 6.6系列で動くように修正したドライバです。

# 使い方
- Kernelのビルド環境を構築する
- 各ディレクトリ以下のMakefileを使ってmakeする
- 出来上がったkoファイルを/lib/modules/$(uname -r)/extra以下にコピー
- 'sudo depmod -a' を実行

注意：すべてのドライバをビルドしてください。

# devicetreeについて
VoiceBonnetのeepromから読み込まれて勝手にデバイスツリーが適用されます。

# 既知の問題
- alsaの設定がよくわからず。（データは転送できていそうだが音が出ない。。。謎）

# Bullseyeの場合
ここのイメージが使えるかと思います。https://github.com/viraniac/aiyprojects-raspbian/releases/tag/v20230326
ただし、arm-v7l用のドライバしかないので32bit環境で動かす必要があります。

Raspberry Pi zero2に変えるだけでかなり動作が改善するので良いかと思います。
ただ、ヘッドフォンからは出力できるのにスピーカーから出力ができておらず。。。


