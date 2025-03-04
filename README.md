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


# 標準イメージの情報

## cmdline.txt

~~~
dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=PARTUUID=32223fc2-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait quiet splash plymouth.ignore-serial-consoles
~~~

## config.txt

~~~
# For more options and information see
# http://rpf.io/configtxt
# Some settings may impact device functionality. See link above for details

# uncomment if you get no picture on HDMI for a default "safe" mode
#hdmi_safe=1

# uncomment this if your display has a black border of unused pixels visible
# and your display can output without overscan
#disable_overscan=1

# uncomment the following to adjust overscan. Use positive numbers if console
# goes off screen, and negative if there is too much border
#overscan_left=16
#overscan_right=16
#overscan_top=16
#overscan_bottom=16

# uncomment to force a console size. By default it will be display's size minus
# overscan.
#framebuffer_width=1280
#framebuffer_height=720

# uncomment if hdmi display is not detected and composite is being output
#hdmi_force_hotplug=1

# uncomment to force a specific HDMI mode (this will force VGA)
#hdmi_group=1
#hdmi_mode=1

# uncomment to force a HDMI mode rather than DVI. This can make audio work in
# DMT (computer monitor) modes
#hdmi_drive=2

# uncomment to increase signal to HDMI, if you have interference, blanking, or
# no display
#config_hdmi_boost=4

# uncomment for composite PAL
#sdtv_mode=2

#uncomment to overclock the arm. 700 MHz is the default.
#arm_freq=800

# Uncomment some or all of these to enable the optional hardware interfaces
#dtparam=i2c_arm=on
dtparam=i2s=on
#dtparam=spi=on

# Uncomment this to enable the lirc-rpi module
#dtoverlay=lirc-rpi

# Additional overlays and parameters are documented /boot/overlays/README

# Enable audio (loads snd_bcm2835)
#dtparam=audio=on
# dtoverlay=dwc2
start_x=1
gpu_mem=128~~~

## デバイスツリー

~~~
/dts-v1/;

/ {
        #address-cells = <0x1>;
        #size-cells = <0x1>;
        compatible = "brcm,bcm2837", "brcm,bcm2836";
        interrupt-parent = <0x1>;
        memreserve = <0x38000000 0x8000000>;
        model = "Raspberry Pi 3 Model B Rev 1.2";
        serial-number = "00000000ec576a22";

        __overrides__ {
                act_led_activelow = "", "", "", "'gpios:8";
                act_led_gpio = "", "", "", "'gpios:4";
                act_led_trigger = "", "", "", "'linux,default-trigger";
                arm_freq = <0x1d 0x636c6f63 0x6b2d6672 0x65717565 0x6e63793a 0x30000000 0x1e636c 0x6f636b2d 0x66726571 0x75656e63 0x793a3000 0x1f 0x636c6f63 0x6b2d6672 0x65717565 0x6e63793a 0x30000000 0x20636c 0x6f636b2d 0x66726571 0x75656e63 0x793a3000>;
                audio = "", "", "", ")status";
                cache_line_size = [00 00 00 1c 63 61 63 68 65 2d 6c 69 6e 65 2d 73 69 7a 65 3a 30 00];
                i2c = "", "", "", "&status";
                i2c0 = "", "", "", "%status";
                i2c0_baudrate = "", "", "", "%clock-frequency:0";
                i2c1 = "", "", "", "&status";
                i2c1_baudrate = "", "", "", "&clock-frequency:0";
                i2c2_baudrate = [00 00 00 14 63 6c 6f 63 6b 2d 66 72 65 71 75 65 6e 63 79 3a 30 00];
                i2c2_iknowwhatimdoing = [00 00 00 14 73 74 61 74 75 73 00];
                i2c_arm = "", "", "", "&status";
                i2c_arm_baudrate = "", "", "", "&clock-frequency:0";
                i2c_baudrate = "", "", "", "&clock-frequency:0";
                i2c_vc = "", "", "", "%status";
                i2c_vc_baudrate = "", "", "", "%clock-frequency:0";
                i2s = "", "", "", "#status";
                pwr_led_activelow = "", "", "", "(gpios:8";
                pwr_led_gpio = "", "", "", "(gpios:4";
                pwr_led_trigger = "", "", "", "(linux,default-trigger";
                random = "", "", "", "+status";
                sd_debug = "", "", "", ",brcm,debug";
                sd_force_pio = "", "", "", ",brcm,force-pio?";
                sd_overclock = "", "", "", ",brcm,overclock-50:0";
                sd_pio_limit = "", "", "", ",brcm,pio-limit:0";
                spi = "", "", "", "$status";
                uart0 = "", "", "", "!status";
                uart1 = "", "", "", "\"status";
                watchdog = "", "", "", "*status";
        };

        __symbols__ {
                act_led = "/leds/act";
                audio = "/soc/audio";
                audio_pins = "/soc/gpio@7e200000/audio_pins";
                aux = "/soc/aux@0x7e215000";
                bt_pins = "/soc/gpio@7e200000/bt_pins";
                clk_osc = "/clocks/clock@3";
                clk_usb = "/clocks/clock@4";
                clocks = "/soc/cprman@7e101000";
                cprman = "/soc/cprman@7e101000";
                cpus = "/cpus";
                dma = "/soc/dma@7e007000";
                dpi = "/soc/dpi@7e208000";
                dsi0 = "/soc/dsi@7e209000";
                dsi1 = "/soc/dsi@7e700000";
                ethernet = "/soc/usb@7e980000/usb1@1/usbether@1";
                expgpio = "/soc/expgpio";
                fb = "/soc/fb";
                firmware = "/soc/firmware";
                firmwarekms = "/soc/firmwarekms@7e600000";
                gpio = "/soc/gpio@7e200000";
                gpu = "/soc/gpu";
                hdmi = "/soc/hdmi@7e902000";
                hvs = "/soc/hvs@7e400000";
                i2c = "/soc/i2c@7e804000";
                i2c0 = "/soc/i2c@7e205000";
                i2c0_pins = "/soc/gpio@7e200000/i2c0";
                i2c1 = "/soc/i2c@7e804000";
                i2c1_pins = "/soc/gpio@7e200000/i2c1";
                i2c2 = "/soc/i2c@7e805000";
                i2c_arm = "/soc/i2c@7e804000";
                i2c_dsi = "/soc/i2cdsi";
                i2c_vc = "/soc/i2c@7e205000";
                i2s = "/soc/i2s@7e203000";
                i2s_pins = "/soc/gpio@7e200000/i2s";
                intc = "/soc/interrupt-controller@7e00b200";
                leds = "/leds";
                local_intc = "/soc/local_intc";
                mailbox = "/soc/mailbox@7e00b880";
                mmc = "/soc/mmc@7e300000";
                pitouchscreen_bridge = "/soc/i2cdsi/bridge@45";
                pitouchscreen_touch = "/soc/i2cdsi/bridge@38";
                pixelvalve0 = "/soc/pixelvalve@7e206000";
                pixelvalve1 = "/soc/pixelvalve@7e207000";
                pixelvalve2 = "/soc/pixelvalve@7e807000";
                power = "/soc/power";
                pwm = "/soc/pwm@7e20c000";
                pwr_led = "/leds/pwr";
                random = "/soc/rng@7e104000";
                sdhost = "/soc/sdhost@7e202000";
                sdhost_pins = "/soc/gpio@7e200000/sdhost_pins";
                sdio_pins = "/soc/gpio@7e200000/sdio_pins";
                smi = "/soc/smi@7e600000";
                soc = "/soc";
                sound = "/soc/sound";
                spi = "/soc/spi@7e204000";
                spi0 = "/soc/spi@7e204000";
                spi0_cs_pins = "/soc/gpio@7e200000/spi0_cs_pins";
                spi0_pins = "/soc/gpio@7e200000/spi0_pins";
                spi1 = "/soc/spi@7e215080";
                spi2 = "/soc/spi@7e2150c0";
                spidev0 = "/soc/spi@7e204000/spidev@0";
                spidev1 = "/soc/spi@7e204000/spidev@1";
                thermal = "/soc/thermal";
                uart0 = "/soc/serial@7e201000";
                uart0_pins = "/soc/gpio@7e200000/uart0_pins";
                uart1 = "/soc/serial@7e215040";
                uart1_pins = "/soc/gpio@7e200000/uart1_pins";
                usb = "/soc/usb@7e980000";
                v3d = "/soc/v3d@7ec00000";
                v7_cpu0 = "/cpus/cpu@0";
                v7_cpu1 = "/cpus/cpu@1";
                v7_cpu2 = "/cpus/cpu@2";
                v7_cpu3 = "/cpus/cpu@3";
                vc4 = "/soc/gpu";
                vchiq = "/soc/vchiq";
                vcsm = "/soc/vcsm";
                vdd_3v3_reg = "/fixedregulator_3v3";
                vdd_5v0_reg = "/fixedregulator_5v0";
                vec = "/soc/vec@7e806000";
                virtgpio = "/soc/virtgpio";
                watchdog = "/soc/watchdog@7e100000";
        };

        aliases {
                audio = "/soc/audio";
                aux = "/soc/aux@0x7e215000";
                dma = "/soc/dma@7e007000";
                ethernet = "/soc/usb@7e980000/usb1@1/usbether@1";
                fb = "/soc/fb";
                gpio = "/soc/gpio@7e200000";
                i2c = "/soc/i2c@7e804000";
                i2c0 = "/soc/i2c@7e205000";
                i2c1 = "/soc/i2c@7e804000";
                i2c2 = "/soc/i2c@7e805000";
                i2c_arm = "/soc/i2c@7e804000";
                i2c_vc = "/soc/i2c@7e205000";
                i2s = "/soc/i2s@7e203000";
                intc = "/soc/interrupt-controller@7e00b200";
                leds = "/leds";
                mailbox = "/soc/mailbox@7e00b880";
                mmc = "/soc/mmc@7e300000";
                random = "/soc/rng@7e104000";
                sdhost = "/soc/sdhost@7e202000";
                serial0 = "/soc/serial@7e215040";
                serial1 = "/soc/serial@7e201000";
                soc = "/soc";
                sound = "/soc/sound";
                spi0 = "/soc/spi@7e204000";
                spi1 = "/soc/spi@7e215080";
                spi2 = "/soc/spi@7e2150c0";
                thermal = "/soc/thermal";
                uart0 = "/soc/serial@7e201000";
                uart1 = "/soc/serial@7e215040";
                usb = "/soc/usb@7e980000";
                vchiq = "/soc/vchiq";
                watchdog = "/soc/watchdog@7e100000";
        };

        axi {

                vc_mem {
                        reg = <0x3ec00000 0x40000000 0xc0000000>;
                };
        };

        chosen {
                bootargs = "8250.nr_uarts=0 bcm2708_fb.fbwidth=1824 bcm2708_fb.fbheight=984 bcm2708_fb.fbswap=1 vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  dwc_otg.lpm_enable=0 console=ttyS0,115200 console=tty1 root=PARTUUID=32223fc2-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait quiet splash plymouth.ignore-serial-consoles";
                kaslr-seed = <0x2dc38037 0x9a6dbf33>;
        };

        clocks {
                #address-cells = <0x1>;
                #size-cells = <0x0>;
                compatible = "simple-bus";

                clock@3 {
                        #clock-cells = <0x0>;
                        clock-frequency = <0x124f800>;
                        clock-output-names = "osc";
                        compatible = "fixed-clock";
                        phandle = <0x3>;
                        reg = <0x3>;
                };

                clock@4 {
                        #clock-cells = <0x0>;
                        clock-frequency = <0x1c9c3800>;
                        clock-output-names = "otg";
                        compatible = "fixed-clock";
                        phandle = <0x16>;
                        reg = <0x4>;
                };
        };

        cpus {
                #address-cells = <0x1>;
                #size-cells = <0x0>;
                phandle = <0x4b>;

                cpu@0 {
                        clock-frequency = <0x47868c00>;
                        compatible = "arm,cortex-a7";
                        device_type = "cpu";
                        phandle = <0x1d>;
                        reg = <0x0>;
                };

                cpu@1 {
                        clock-frequency = <0x47868c00>;
                        compatible = "arm,cortex-a7";
                        device_type = "cpu";
                        phandle = <0x1e>;
                        reg = <0x1>;
                };

                cpu@2 {
                        clock-frequency = <0x47868c00>;
                        compatible = "arm,cortex-a7";
                        device_type = "cpu";
                        phandle = <0x1f>;
                        reg = <0x2>;
                };

                cpu@3 {
                        clock-frequency = <0x47868c00>;
                        compatible = "arm,cortex-a7";
                        device_type = "cpu";
                        phandle = <0x20>;
                        reg = <0x3>;
                };
        };

        fixedregulator_3v3 {
                compatible = "regulator-fixed";
                phandle = <0x49>;
                regulator-always-on;
                regulator-max-microvolt = <0x325aa0>;
                regulator-min-microvolt = <0x325aa0>;
                regulator-name = "3v3";
        };

        fixedregulator_5v0 {
                compatible = "regulator-fixed";
                phandle = <0x48>;
                regulator-always-on;
                regulator-max-microvolt = <0x4c4b40>;
                regulator-min-microvolt = <0x4c4b40>;
                regulator-name = "5v0";
        };

        hat {
                product = "AIY VoiceBonnet";
                product_id = "0x0003";
                product_ver = "0x0001";
                uuid = "ef4d2a98-514e-4651-5420-2020ff110329";
                vendor = "Google, LLC";
        };

        leds {
                compatible = "gpio-leds";
                phandle = <0x4a>;

                act {
                        gpios = <0x1b 0x0 0x0>;
                        label = "led0";
                        linux,default-trigger = "mmc0";
                        phandle = <0x27>;
                };

                pwr {
                        gpios = <0x15 0x7 0x0>;
                        label = "led1";
                        linux,default-trigger = "input";
                        phandle = <0x28>;
                };
        };

        memory {
                device_type = "memory";
                reg = <0x0 0x38000000>;
        };

        soc {
                #address-cells = <0x1>;
                #size-cells = <0x1>;
                compatible = "simple-bus";
                dma-ranges = <0xc0000000 0x0 0x3f000000>;
                phandle = <0x2d>;
                ranges = <0x7e000000 0x3f000000 0x1000000 0x40000000 0x40000000 0x40000>;

                arm-pmu {
                        compatible = "arm,cortex-a7-pmu";
                        interrupt-parent = <0x2>;
                        interrupts = <0x9>;
                };

                audio {
                        brcm,pwm-channels = <0x8>;
                        compatible = "brcm,bcm2835-audio";
                        phandle = <0x29>;
                        pinctrl-0 = <0x1a>;
                        pinctrl-names = "default";
                        status = "disabled";
                };

                aux@0x7e215000 {
                        #clock-cells = <0x1>;
                        #interrupt-cells = <0x1>;
                        clocks = <0x7 0x14>;
                        compatible = "brcm,bcm2835-aux";
                        interrupt-controller;
                        interrupts = <0x1 0x1d>;
                        phandle = <0x10>;
                        reg = <0x7e215000 0x8>;
                };

                cprman@7e101000 {
                        #clock-cells = <0x1>;
                        clocks = <0x3 0x4 0x0 0x4 0x1 0x4 0x2 0x5 0x0 0x5 0x1 0x5 0x2>;
                        compatible = "brcm,bcm2835-cprman";
                        firmware = <0x6>;
                        phandle = <0x7>;
                        reg = <0x7e101000 0x2000>;
                };

                dma@7e007000 {
                        #dma-cells = <0x1>;
                        brcm,dma-channel-mask = <0x7f34>;
                        compatible = "brcm,bcm2835-dma";
                        interrupt-names = "dma0", "dma1", "dma2", "dma3", "dma4", "dma5", "dma6", "dma7", "dma8", "dma9", "dma10", "dma11", "dma12", "dma13", "dma14", "dma-shared-all";
                        interrupts = <0x1 0x10 0x1 0x11 0x1 0x12 0x1 0x13 0x1 0x14 0x1 0x15 0x1 0x16 0x1 0x17 0x1 0x18 0x1 0x19 0x1 0x1a 0x1 0x1b 0x1 0x1b 0x1 0x1b 0x1 0x1b 0x1 0x1c>;
                        phandle = <0xa>;
                        reg = <0x7e007000 0xf00>;
                };

                dpi@7e208000 {
                        #address-cells = <0x1>;
                        #size-cells = <0x0>;
                        clock-names = "core", "pixel";
                        clocks = <0x7 0x14 0x7 0x2c>;
                        compatible = "brcm,bcm2835-dpi";
                        phandle = <0x3d>;
                        reg = <0x7e208000 0x8c>;
                        status = "disabled";
                };

                dsi@7e209000 {
                        #address-cells = <0x1>;
                        #clock-cells = <0x1>;
                        #size-cells = <0x0>;
                        clock-names = "phy", "escape", "pixel";
                        clock-output-names = "dsi0_byte", "dsi0_ddr2", "dsi0_ddr";
                        clocks = <0x7 0x20 0x7 0x2f 0x7 0x31>;
                        compatible = "brcm,bcm2835-dsi0";
                        interrupts = <0x2 0x4>;
                        phandle = <0x4>;
                        reg = <0x7e209000 0x78>;
                        status = "disabled";
                };

                dsi@7e700000 {
                        #address-cells = <0x1>;
                        #clock-cells = <0x1>;
                        #size-cells = <0x0>;
                        clock-names = "phy", "escape", "pixel";
                        clock-output-names = "dsi1_byte", "dsi1_ddr2", "dsi1_ddr";
                        clocks = <0x7 0x23 0x7 0x30 0x7 0x32>;
                        compatible = "brcm,bcm2835-dsi1";
                        interrupts = <0x2 0xc>;
                        phandle = <0x5>;
                        power-domains = <0x12 0x12>;
                        reg = <0x7e700000 0x8c>;
                        status = "disabled";
                };

                expgpio {
                        #gpio-cells = <0x2>;
                        compatible = "brcm,bcm2835-expgpio";
                        firmware = <0x6>;
                        gpio-controller;
                        phandle = <0x15>;
                        status = "okay";
                };

                fb {
                        compatible = "brcm,bcm2708-fb";
                        firmware = <0x6>;
                        phandle = <0x44>;
                        status = "okay";
                };

                firmware {
                        compatible = "raspberrypi,bcm2835-firmware";
                        mboxes = <0x19>;
                        phandle = <0x6>;
                };

                firmwarekms@7e600000 {
                        brcm,firmware = <0x6>;
                        compatible = "raspberrypi,rpi-firmware-kms";
                        interrupts = <0x2 0x10>;
                        phandle = <0x3f>;
                        reg = <0x7e600000 0x100>;
                        status = "disabled";
                };

                gpio@7e200000 {
                        #gpio-cells = <0x2>;
                        #interrupt-cells = <0x2>;
                        compatible = "brcm,bcm2835-gpio";
                        gpio-controller;
                        interrupt-controller;
                        interrupts = <0x2 0x11 0x2 0x12>;
                        phandle = <0xc>;
                        pinctrl-0 = <0x4c>;
                        pinctrl-names = "default";
                        reg = <0x7e200000 0xb4>;

                        audio_pins {
                                brcm,function = <0x4>;
                                brcm,pins = <0x28 0x29>;
                                phandle = <0x1a>;
                        };

                        bt_pins {
                                brcm,function = <0x4>;
                                brcm,pins = <0x2b>;
                                brcm,pull = <0x0>;
                                phandle = <0x9>;
                        };

                        hp_detect_pins {
                                brcm,function = <0x0>;
                                brcm,pins = <0x18>;
                                brcm,pull = <0x0>;
                                linux,phandle = <0x4c>;
                                phandle = <0x4c>;
                        };

                        i2c0 {
                                brcm,function = <0x4>;
                                brcm,pins = <0x0 0x1>;
                                phandle = <0xf>;
                        };

                        i2c1 {
                                brcm,function = <0x4>;
                                brcm,pins = <0x2 0x3>;
                                phandle = <0x13>;
                        };

                        i2s {
                                brcm,function = <0x4>;
                                brcm,pins = <0x12 0x13 0x14 0x15>;
                                phandle = <0xb>;
                        };

                        sdhost_pins {
                                brcm,function = <0x4>;
                                brcm,pins = <0x30 0x31 0x32 0x33 0x34 0x35>;
                                phandle = <0x17>;
                        };

                        sdio_pins {
                                brcm,function = <0x7>;
                                brcm,pins = <0x22 0x23 0x24 0x25 0x26 0x27>;
                                brcm,pull = <0x0 0x2 0x2 0x2 0x2 0x2>;
                                phandle = <0x18>;
                        };

                        spi0_cs_pins {
                                brcm,function = <0x1>;
                                brcm,pins = <0x8 0x7>;
                                phandle = <0xe>;
                        };

                        spi0_pins {
                                brcm,function = <0x4>;
                                brcm,pins = <0x9 0xa 0xb>;
                                phandle = <0xd>;
                        };

                        uart0_pins {
                                brcm,function = <0x7>;
                                brcm,pins = <0x20 0x21>;
                                brcm,pull = <0x0 0x2>;
                                phandle = <0x8>;
                        };

                        uart1_pins {
                                brcm,function;
                                brcm,pins;
                                brcm,pull;
                                phandle = <0x11>;
                        };
                };

                gpiomem {
                        compatible = "brcm,bcm2835-gpiomem";
                        reg = <0x7e200000 0x1000>;
                };

                gpu {
                        compatible = "brcm,bcm2835-vc4";
                        phandle = <0x3c>;
                        status = "disabled";
                };

                hdmi@7e902000 {
                        clock-names = "pixel", "hdmi";
                        clocks = <0x7 0x10 0x7 0x19>;
                        compatible = "brcm,bcm2835-hdmi";
                        ddc = <0x14>;
                        dma-names = "audio-rx";
                        dmas = <0xa 0x11>;
                        hpd-gpios = <0x15 0x4 0x1>;
                        interrupts = <0x2 0x8 0x2 0x9>;
                        phandle = <0x38>;
                        power-domains = <0x12 0x5>;
                        reg = <0x7e902000 0x600 0x7e808000 0x100>;
                        status = "disabled";
                };

                hvs@7e400000 {
                        compatible = "brcm,bcm2835-hvs";
                        interrupts = <0x2 0x1>;
                        phandle = <0x35>;
                        reg = <0x7e400000 0x6000>;
                        status = "disabled";
                };

                i2c@7e205000 {
                        #address-cells = <0x1>;
                        #size-cells = <0x0>;
                        clock-frequency = <0x186a0>;
                        clocks = <0x7 0x14>;
                        compatible = "brcm,bcm2835-i2c";
                        interrupts = <0x2 0x15>;
                        phandle = <0x25>;
                        pinctrl-0 = <0xf>;
                        pinctrl-names = "default";
                        reg = <0x7e205000 0x1000>;
                        status = "disabled";
                };

                i2c@7e804000 {
                        #address-cells = <0x1>;
                        #size-cells = <0x0>;
                        clock-frequency = <0x186a0>;
                        clocks = <0x7 0x14>;
                        compatible = "brcm,bcm2835-i2c";
                        interrupts = <0x2 0x15>;
                        phandle = <0x26>;
                        pinctrl-0 = <0x13>;
                        pinctrl-names = "default";
                        reg = <0x7e804000 0x1000>;
                        status = "okay";

                        aiy-io-i2c@52 {
                                compatible = "google,aiy-io-i2c";
                                reg = <0x52>;
                                status = "okay";
                                type = "voice";

                                aiy-gpio {
                                        #gpio-cells = <0x2>;
                                        compatible = "google,gpio-aiy-io";
                                        gpio-controller;
                                        linux,phandle = <0x4e>;
                                        phandle = <0x4e>;
                                };
                        };

                        ktd2026@31 {
                                compatible = "kinetic,ktd2026";
                                reg = <0x31>;
                                status = "okay";
                        };

                        rt5645@1a {
                                compatible = "realtek,rt5645";
                                hp-detect-gpios = <0xc 0x18 0x0>;
                                interrupt-parent = <0xc>;
                                interrupts = <0x18 0x3>;
                                linux,phandle = <0x4d>;
                                phandle = <0x4d>;
                                realtek,dmic1-data-pin = <0x0>;
                                realtek,dmic2-data-pin = <0x0>;
                                realtek,jd-invert;
                                realtek,jd-mode = <0x0>;
                                reg = <0x1a>;
                        };
                };

                i2c@7e805000 {
                        #address-cells = <0x1>;
                        #size-cells = <0x0>;
                        clock-frequency = <0x186a0>;
                        clocks = <0x7 0x14>;
                        compatible = "brcm,bcm2835-i2c";
                        interrupts = <0x2 0x15>;
                        phandle = <0x14>;
                        reg = <0x7e805000 0x1000>;
                        status = "disabled";
                };

                i2cdsi {
                        #address-cells = <0x1>;
                        #size-cells = <0x0>;
                        compatible = "i2c-gpio";
                        gpios = <0xc 0x2c 0x0 0xc 0x2d 0x0>;
                        phandle = <0x41>;
                        status = "disabled";

                        bridge@38 {
                                compatible = "raspberrypi,touchscreen-ts-i2c";
                                phandle = <0x43>;
                                reg = <0x38>;
                        };

                        bridge@45 {
                                compatible = "raspberrypi,touchscreen-bridge-i2c";
                                phandle = <0x42>;
                                reg = <0x45>;
                        };
                };

                i2s@7e203000 {
                        #sound-dai-cells = <0x0>;
                        clocks = <0x7 0x1f>;
                        compatible = "brcm,bcm2835-i2s";
                        dma-names = "tx", "rx";
                        dmas = <0xa 0x2 0xa 0x3>;
                        phandle = <0x23>;
                        pinctrl-0 = <0xb>;
                        pinctrl-names = "default";
                        reg = <0x7e203000 0x24>;
                        status = "okay";
                };

                interrupt-controller@7e00b200 {
                        #interrupt-cells = <0x2>;
                        compatible = "brcm,bcm2836-armctrl-ic";
                        interrupt-controller;
                        interrupt-parent = <0x2>;
                        interrupts = <0x8>;
                        phandle = <0x1>;
                        reg = <0x7e00b200 0x200>;
                };

                local_intc {
                        #interrupt-cells = <0x1>;
                        compatible = "brcm,bcm2836-l1-intc";
                        interrupt-controller;
                        interrupt-parent = <0x2>;
                        phandle = <0x2>;
                        reg = <0x40000000 0x100>;
                };

                mailbox@7e00b880 {
                        #mbox-cells = <0x0>;
                        compatible = "brcm,bcm2835-mbox";
                        interrupts = <0x0 0x1>;
                        phandle = <0x19>;
                        reg = <0x7e00b880 0x40>;
                };

                mmc@7e300000 {
                        brcm,overclock-50 = <0x0>;
                        bus-width = <0x4>;
                        clocks = <0x7 0x1c>;
                        compatible = "brcm,bcm2835-mmc";
                        dma-names = "rx-tx";
                        dmas = <0xa 0xb>;
                        interrupts = <0x2 0x1e>;
                        non-removable;
                        phandle = <0x3e>;
                        pinctrl-0 = <0x18>;
                        pinctrl-names = "default";
                        reg = <0x7e300000 0x100>;
                        status = "okay";
                };

                pixelvalve@7e206000 {
                        compatible = "brcm,bcm2835-pixelvalve0";
                        interrupts = <0x2 0xd>;
                        phandle = <0x30>;
                        reg = <0x7e206000 0x100>;
                        status = "disabled";
                };

                pixelvalve@7e207000 {
                        compatible = "brcm,bcm2835-pixelvalve1";
                        interrupts = <0x2 0xe>;
                        phandle = <0x31>;
                        reg = <0x7e207000 0x100>;
                        status = "disabled";
                };

                pixelvalve@7e807000 {
                        compatible = "brcm,bcm2835-pixelvalve2";
                        interrupts = <0x2 0xa>;
                        phandle = <0x37>;
                        reg = <0x7e807000 0x100>;
                        status = "disabled";
                };

                power {
                        #power-domain-cells = <0x1>;
                        compatible = "raspberrypi,bcm2835-power";
                        firmware = <0x6>;
                        phandle = <0x12>;
                };

                pwm@7e20c000 {
                        #pwm-cells = <0x2>;
                        assigned-clock-rates = <0x989680>;
                        assigned-clocks = <0x7 0x1e>;
                        clocks = <0x7 0x1e>;
                        compatible = "brcm,bcm2835-pwm";
                        phandle = <0x34>;
                        reg = <0x7e20c000 0x28>;
                        status = "disabled";
                };

                rng@7e104000 {
                        compatible = "brcm,bcm2835-rng";
                        phandle = <0x2b>;
                        reg = <0x7e104000 0x10>;
                };

                sdhost@7e202000 {
                        brcm,overclock-50 = <0x0>;
                        brcm,pio-limit = <0x1>;
                        bus-width = <0x4>;
                        clocks = <0x7 0x14>;
                        compatible = "brcm,bcm2835-sdhost";
                        dma-names = "rx-tx";
                        dmas = <0xa 0xd>;
                        interrupts = <0x2 0x18>;
                        phandle = <0x2c>;
                        pinctrl-0 = <0x17>;
                        pinctrl-names = "default";
                        reg = <0x7e202000 0x100>;
                        status = "okay";
                };

                serial@7e201000 {
                        arm,primecell-periphid = <0x241011>;
                        clock-names = "uartclk", "apb_pclk";
                        clocks = <0x7 0x13 0x7 0x14>;
                        compatible = "brcm,bcm2835-pl011", "arm,pl011", "arm,primecell";
                        cts-event-workaround;
                        interrupts = <0x2 0x19>;
                        phandle = <0x21>;
                        pinctrl-0 = <0x8 0x9>;
                        pinctrl-names = "default";
                        reg = <0x7e201000 0x1000>;
                        status = "okay";
                };

                serial@7e215040 {
                        clocks = <0x10 0x0>;
                        compatible = "brcm,bcm2835-aux-uart";
                        interrupt-parent = <0x10>;
                        interrupts = <0x0>;
                        phandle = <0x22>;
                        pinctrl-0 = <0x11>;
                        pinctrl-names = "default";
                        reg = <0x7e215040 0x40>;
                        status = "disabled";
                };

                smi@7e600000 {
                        assigned-clock-rates = <0x7735940>;
                        assigned-clocks = <0x7 0x2a>;
                        clocks = <0x7 0x2a>;
                        compatible = "brcm,bcm2835-smi";
                        dma-names = "rx-tx";
                        dmas = <0xa 0x4>;
                        interrupts = <0x2 0x10>;
                        phandle = <0x40>;
                        reg = <0x7e600000 0x100>;
                        status = "disabled";
                };

                sound {
                        aiy-voicebonnet,audio-codec = <0x4d>;
                        compatible = "google,aiy-voicebonnet";
                        google,model = "aiy-voicebonnet";
                        i2s-controller = <0x23>;
                        mic-switch-gpios = <0x4e 0x0 0x0>;
                        phandle = <0x47>;
                        status = "okay";
                };

                spi@7e204000 {
                        #address-cells = <0x1>;
                        #size-cells = <0x0>;
                        clocks = <0x7 0x14>;
                        compatible = "brcm,bcm2835-spi";
                        cs-gpios = <0xc 0x8 0x1 0xc 0x7 0x1>;
                        dma-names = "tx", "rx";
                        dmas = <0xa 0x6 0xa 0x7>;
                        interrupts = <0x2 0x16>;
                        phandle = <0x24>;
                        pinctrl-0 = <0xd 0xe>;
                        pinctrl-names = "default";
                        reg = <0x7e204000 0x1000>;
                        status = "disabled";

                        spidev@0 {
                                #address-cells = <0x1>;
                                #size-cells = <0x0>;
                                compatible = "spidev";
                                phandle = <0x2e>;
                                reg = <0x0>;
                                spi-max-frequency = <0x7735940>;
                        };

                        spidev@1 {
                                #address-cells = <0x1>;
                                #size-cells = <0x0>;
                                compatible = "spidev";
                                phandle = <0x2f>;
                                reg = <0x1>;
                                spi-max-frequency = <0x7735940>;
                        };
                };

                spi@7e215080 {
                        #address-cells = <0x1>;
                        #size-cells = <0x0>;
                        clocks = <0x10 0x1>;
                        compatible = "brcm,bcm2835-aux-spi";
                        interrupt-parent = <0x10>;
                        interrupts = <0x1>;
                        phandle = <0x32>;
                        reg = <0x7e215080 0x40>;
                        status = "disabled";
                };

                spi@7e2150c0 {
                        #address-cells = <0x1>;
                        #size-cells = <0x0>;
                        clocks = <0x10 0x2>;
                        compatible = "brcm,bcm2835-aux-spi";
                        interrupt-parent = <0x10>;
                        interrupts = <0x2>;
                        phandle = <0x33>;
                        reg = <0x7e2150c0 0x40>;
                        status = "disabled";
                };

                syscon@40000000 {
                        compatible = "brcm,bcm2836-arm-local", "syscon";
                        reg = <0x40000000 0x100>;
                };

                thermal {
                        compatible = "brcm,bcm2835-thermal";
                        firmware = <0x6>;
                        phandle = <0x46>;
                };

                timer {
                        always-on;
                        compatible = "arm,armv7-timer";
                        interrupt-parent = <0x2>;
                        interrupts = <0x0 0x1 0x3 0x2>;
                };

                usb@7e980000 {
                        #address-cells = <0x1>;
                        #size-cells = <0x0>;
                        clock-names = "otg";
                        clocks = <0x16>;
                        compatible = "brcm,bcm2708-usb";
                        interrupts = <0x2 0x0 0x1 0x9>;
                        phandle = <0x39>;
                        power-domains = <0x12 0x6>;
                        reg = <0x7e980000 0x10000 0x7e006000 0x1000>;

                        usb1@1 {
                                #address-cells = <0x1>;
                                #size-cells = <0x0>;
                                compatible = "usb424,9514";
                                reg = <0x1>;

                                usbether@1 {
                                        compatible = "usb424,ec00";
                                        local-mac-address = [b8 27 eb 57 6a 22];
                                        phandle = <0x3a>;
                                        reg = <0x1>;
                                };
                        };
                };

                v3d@7ec00000 {
                        compatible = "brcm,vc4-v3d";
                        interrupts = <0x1 0xa>;
                        phandle = <0x3b>;
                        power-domains = <0x12 0xa>;
                        reg = <0x7ec00000 0x1000>;
                        status = "disabled";
                };

                vchiq {
                        cache-line-size = <0x40>;
                        compatible = "brcm,bcm2835-vchiq";
                        firmware = <0x6>;
                        interrupts = <0x0 0x2>;
                        phandle = <0x1c>;
                        reg = <0x7e00b840 0xf>;
                };

                vcsm {
                        compatible = "raspberrypi,bcm2835-vcsm";
                        firmware = <0x6>;
                        phandle = <0x45>;
                        status = "okay";
                };

                vec@7e806000 {
                        clocks = <0x7 0x18>;
                        compatible = "brcm,bcm2835-vec";
                        interrupts = <0x2 0x1b>;
                        phandle = <0x36>;
                        reg = <0x7e806000 0x1000>;
                        status = "disabled";
                };

                virtgpio {
                        #gpio-cells = <0x2>;
                        compatible = "brcm,bcm2835-virtgpio";
                        firmware = <0x6>;
                        gpio-controller;
                        phandle = <0x1b>;
                        status = "okay";
                };

                watchdog@7e100000 {
                        compatible = "brcm,bcm2835-pm-wdt";
                        phandle = <0x2a>;
                        reg = <0x7e100000 0x28>;
                };
        };

        system {
                linux,revision = <0xa22082>;
                linux,serial = <0x0 0xec576a22>;
        };
};
~~~

## aplay -lの結果

~~~
**** List of PLAYBACK Hardware Devices ****
card 0: aiyvoicebonnet [aiy-voicebonnet], device 0: Google AIY Voice Bonnet SoundCard HiFi rt5645-aif1-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
~~~

## amixerの結果

~~~
pi@raspberrypi:~ $ amixer controls
numid=4,iface=MIXER,name='Master Playback Switch'
numid=3,iface=MIXER,name='Master Playback Volume'
numid=2,iface=MIXER,name='Capture Switch'
numid=1,iface=MIXER,name='Capture Volume'
~~~

~~~
pi@raspberrypi:~ $ amixer scontrols
Simple mixer control 'Master',0
Simple mixer control 'Capture',0
~~~
