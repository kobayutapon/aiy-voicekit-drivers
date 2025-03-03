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


# Controlの種類

amixer -c 2 controlsの出力結果

---
~~~
numid=24,iface=CARD,name='Headphone Jack'
numid=4,iface=MIXER,name='Headphone Channel Switch'
numid=25,iface=MIXER,name='Headphone Switch'
numid=5,iface=MIXER,name='Headphone Playback Volume'
numid=20,iface=MIXER,name='Mono ADC Boost Capture Volume'
numid=17,iface=MIXER,name='Mono ADC Capture Switch'
numid=18,iface=MIXER,name='Mono ADC Capture Volume'
numid=44,iface=MIXER,name='Mono ADC L1 Mux'
numid=43,iface=MIXER,name='Mono ADC L2 Mux'
numid=51,iface=MIXER,name='Mono ADC MIXL ADC1 Switch'
numid=52,iface=MIXER,name='Mono ADC MIXL ADC2 Switch'
numid=53,iface=MIXER,name='Mono ADC MIXR ADC1 Switch'
numid=54,iface=MIXER,name='Mono ADC MIXR ADC2 Switch'
numid=45,iface=MIXER,name='Mono ADC R1 Mux'
numid=46,iface=MIXER,name='Mono ADC R2 Mux'
numid=71,iface=MIXER,name='Mono DAC MIXL DAC L1 Switch'
numid=72,iface=MIXER,name='Mono DAC MIXL DAC L2 Switch'
numid=73,iface=MIXER,name='Mono DAC MIXL DAC R2 Switch'
numid=76,iface=MIXER,name='Mono DAC MIXR DAC L2 Switch'
numid=74,iface=MIXER,name='Mono DAC MIXR DAC R1 Switch'
numid=75,iface=MIXER,name='Mono DAC MIXR DAC R2 Switch'
numid=11,iface=MIXER,name='Mono DAC Playback Volume'
numid=41,iface=MIXER,name='Mono DMIC L Mux'
numid=42,iface=MIXER,name='Mono DMIC R Mux'
numid=19,iface=MIXER,name='ADC Boost Capture Volume'
numid=15,iface=MIXER,name='ADC Capture Switch'
numid=16,iface=MIXER,name='ADC Capture Volume'
numid=21,iface=MIXER,name='I2S2 Func Switch'
numid=61,iface=MIXER,name='DAC L2 Mux'
numid=78,iface=MIXER,name='DAC MIXL DAC L2 Switch'
numid=79,iface=MIXER,name='DAC MIXL DAC R2 Switch'
numid=77,iface=MIXER,name='DAC MIXL Sto DAC Mix L Switch'
numid=82,iface=MIXER,name='DAC MIXR DAC L2 Switch'
numid=81,iface=MIXER,name='DAC MIXR DAC R2 Switch'
numid=80,iface=MIXER,name='DAC MIXR Sto DAC Mix R Switch'
numid=62,iface=MIXER,name='DAC R2 Mux'
numid=23,iface=MIXER,name='DAC1 Digital Volume Control Func'
numid=63,iface=MIXER,name='DAC1 L Mux'
numid=58,iface=MIXER,name='DAC1 MIXL DAC1 Switch'
numid=57,iface=MIXER,name='DAC1 MIXL Stereo ADC Switch'
numid=60,iface=MIXER,name='DAC1 MIXR DAC1 Switch'
numid=59,iface=MIXER,name='DAC1 MIXR Stereo ADC Switch'
numid=10,iface=MIXER,name='DAC1 Playback Volume'
numid=64,iface=MIXER,name='DAC1 R Mux'
numid=9,iface=MIXER,name='DAC2 Playback Switch'
numid=115,iface=MIXER,name='HPO MIX DAC1 Switch'
numid=116,iface=MIXER,name='HPO MIX HPVOL Switch'
numid=109,iface=MIXER,name='HPOVOL L Switch'
numid=104,iface=MIXER,name='HPOVOL MIXL BST1 Switch'
numid=101,iface=MIXER,name='HPOVOL MIXL DAC1 Switch'
numid=102,iface=MIXER,name='HPOVOL MIXL DAC2 Switch'
numid=103,iface=MIXER,name='HPOVOL MIXL INL Switch'
numid=108,iface=MIXER,name='HPOVOL MIXR BST2 Switch'
numid=105,iface=MIXER,name='HPOVOL MIXR DAC1 Switch'
numid=106,iface=MIXER,name='HPOVOL MIXR DAC2 Switch'
numid=107,iface=MIXER,name='HPOVOL MIXR INR Switch'
numid=110,iface=MIXER,name='HPOVOL R Switch'
numid=55,iface=MIXER,name='IF2 ADC Mux'
numid=14,iface=MIXER,name='IN Capture Volume'
numid=12,iface=MIXER,name='IN1 Boost'
numid=13,iface=MIXER,name='IN2 Boost'
numid=27,iface=MIXER,name='Int Mic Switch'
numid=117,iface=MIXER,name='LOUT MIX DAC L1 Switch'
numid=118,iface=MIXER,name='LOUT MIX DAC R1 Switch'
numid=119,iface=MIXER,name='LOUT MIX OUTMIX L Switch'
numid=120,iface=MIXER,name='LOUT MIX OUTMIX R Switch'
numid=7,iface=MIXER,name='OUT Channel Switch'
numid=91,iface=MIXER,name='OUT MIXL BST1 Switch'
numid=94,iface=MIXER,name='OUT MIXL DAC L1 Switch'
numid=93,iface=MIXER,name='OUT MIXL DAC L2 Switch'
numid=92,iface=MIXER,name='OUT MIXL INL Switch'
numid=95,iface=MIXER,name='OUT MIXR BST2 Switch'
numid=98,iface=MIXER,name='OUT MIXR DAC R1 Switch'
numid=97,iface=MIXER,name='OUT MIXR DAC R2 Switch'
numid=96,iface=MIXER,name='OUT MIXR INR Switch'
numid=6,iface=MIXER,name='OUT Playback Switch'
numid=8,iface=MIXER,name='OUT Playback Volume'
numid=121,iface=MIXER,name='PDM1 L Mux'
numid=123,iface=MIXER,name='PDM1 L Switch'
numid=122,iface=MIXER,name='PDM1 R Mux'
numid=124,iface=MIXER,name='PDM1 R Switch'
numid=31,iface=MIXER,name='RECMIXL BST1 Switch'
numid=30,iface=MIXER,name='RECMIXL BST2 Switch'
numid=28,iface=MIXER,name='RECMIXL HPOL Switch'
numid=29,iface=MIXER,name='RECMIXL INL Switch'
numid=32,iface=MIXER,name='RECMIXL OUT MIXL Switch'
numid=36,iface=MIXER,name='RECMIXR BST1 Switch'
numid=35,iface=MIXER,name='RECMIXR BST2 Switch'
numid=33,iface=MIXER,name='RECMIXR HPOR Switch'
numid=34,iface=MIXER,name='RECMIXR INR Switch'
numid=37,iface=MIXER,name='RECMIXR OUT MIXR Switch'
numid=129,iface=MIXER,name='RT5645 IF1 ADC Mux'
numid=130,iface=MIXER,name='RT5645 IF1 ADC1 Swap Mux'
numid=131,iface=MIXER,name='RT5645 IF1 ADC2 Swap Mux'
numid=132,iface=MIXER,name='RT5645 IF1 ADC3 Swap Mux'
numid=125,iface=MIXER,name='RT5645 IF1 DAC1 L Mux'
numid=126,iface=MIXER,name='RT5645 IF1 DAC1 R Mux'
numid=127,iface=MIXER,name='RT5645 IF1 DAC2 L Mux'
numid=128,iface=MIXER,name='RT5645 IF1 DAC2 R Mux'
numid=86,iface=MIXER,name='SPK MIXL BST1 Switch'
numid=83,iface=MIXER,name='SPK MIXL DAC L1 Switch'
numid=84,iface=MIXER,name='SPK MIXL DAC L2 Switch'
numid=85,iface=MIXER,name='SPK MIXL INL Switch'
numid=90,iface=MIXER,name='SPK MIXR BST2 Switch'
numid=87,iface=MIXER,name='SPK MIXR DAC R1 Switch'
numid=88,iface=MIXER,name='SPK MIXR DAC R2 Switch'
numid=89,iface=MIXER,name='SPK MIXR INR Switch'
numid=99,iface=MIXER,name='SPKVOL L Switch'
numid=100,iface=MIXER,name='SPKVOL R Switch'
numid=111,iface=MIXER,name='SPOL MIX DAC L1 Switch'
numid=112,iface=MIXER,name='SPOL MIX SPKVOL L Switch'
numid=113,iface=MIXER,name='SPOR MIX DAC R1 Switch'
numid=114,iface=MIXER,name='SPOR MIX SPKVOL R Switch'
numid=1,iface=MIXER,name='Speaker Channel Switch'
numid=3,iface=MIXER,name='Speaker ClassD Playback Volume'
numid=22,iface=MIXER,name='Speaker HWEQ'
numid=2,iface=MIXER,name='Speaker Playback Volume'
numid=26,iface=MIXER,name='Speaker Switch'
numid=65,iface=MIXER,name='Stereo DAC MIXL DAC L1 Switch'
numid=66,iface=MIXER,name='Stereo DAC MIXL DAC L2 Switch'
numid=67,iface=MIXER,name='Stereo DAC MIXL DAC R1 Switch'
numid=70,iface=MIXER,name='Stereo DAC MIXR DAC L1 Switch'
numid=68,iface=MIXER,name='Stereo DAC MIXR DAC R1 Switch'
numid=69,iface=MIXER,name='Stereo DAC MIXR DAC R2 Switch'
numid=40,iface=MIXER,name='Stereo1 ADC1 Mux'
numid=39,iface=MIXER,name='Stereo1 ADC2 Mux'
numid=38,iface=MIXER,name='Stereo1 DMIC Mux'
numid=47,iface=MIXER,name='Sto1 ADC MIXL ADC1 Switch'
numid=48,iface=MIXER,name='Sto1 ADC MIXL ADC2 Switch'
numid=49,iface=MIXER,name='Sto1 ADC MIXR ADC1 Switch'
numid=50,iface=MIXER,name='Sto1 ADC MIXR ADC2 Switch'
numid=56,iface=MIXER,name='VAD ADC Mux'
~~~
