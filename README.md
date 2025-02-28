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
