# tiva-c-vscode-image


Creation of a modern system image for the System Programming class of the Computer Engineering programme of the Kocaeli University. 


<!---

Creating a modern system image for the System Programming class of the Computer Engineering programme of the Kocaeli University. 

After following the previous Linuxer's system image creation guide (until the GNU MCU Eclipse) and creating a base Debian XFCE installation, I decided to look into using VSCode and I apparently could, if I used VSCode as the text editor and the GUI for the commands that will make and flash the projects in the background. The guide I mentioned is: https://github.com/KOU-Embedded-System-Lab/os-base-image/tree/master/debian

I found a GitHub repository where the Tiva C board toolchain (distributed with Texas Code Composer Studio) were uploaded and cloned it. According to the usage instructions I could just go into a project, run 'make' to build the project and flash the .bin file located in the 'gcc' folder, using 'lm4flash'. And it worked.
But your average student would not know about Linux and it could provide a huge difficulty curve for a fresh student to use a terminal, and I have discovered a VSCode addon called 'VsCode Action Buttons' by 'Seun LanLege', and saw how easy it was to create custom buttons to run custom commands. The user's settings.json is modified to include the custom commands and the syntax is something like:

--->

## English
#TODO

## Türkçe


### Özetle Ne Yapılır

https://github.com/KOU-Embedded-System-Lab/os-base-image/tree/master/debian adresinde 2018'den beri kullanılan Eclipse imajının hazırlanması için talimatları bulunur. GNU MCU Eclipse başlığına kadar talimatları takip edilip temel bir Debian kurulumu oluşturulur. Ardından aşağıda belirtilen gerekli paketleri kurulur, sonrasında VSCode indirilip kurulur, kullanılacak olan eklenti kurulur ve ayarlanılır, ardından toolchain indirilip örnek projelerden biri Tiva C'ye flaşlanır ve geliştirme ortamının kurulumunun başarılı olduğuna emin olunur.

### Çabuk Kullanım

Releases kısmından debian-kou-embedded-v2021-12-07.ova dosyası indirilir ve VirtualBox'ta içe aktarılır. Ardından çalıştırılır, sonra masaüstünden VSCode açılır.

### Kurulan Paketler
Debian kurulumunun ardından komut satırından itibaren kurulan tüm paketler şunlar:

`xfce4 xfce4-goodies bash-completion linux-headers-amd64 firmware-linux gcc make gcc-arm-none-eabi gdb-multiarch lm4flash elinks`


### VSCode Kurulumu ve Ayarlaması

elinks bir komut satırı tarayıcısıdır. `elinks url` şeklinde çalıştırılabilir. VSCode'u indirmek için `elinks https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64` komutunu çalıştırılır ve indirmeye onay verilir. İndirmenin ardından .deb paketinden `sudo dpkg --install vscodepaketiismi.deb` ile VSCode kurulur. Ardından VSCode açılır ve geliştiricisi Seun LanLege olan `VsCode Action Buttons` eklentisini kurulur. Eklentinin yanındaki dişliye, oradan `Extension Settings`'e, oradan da `Edit in settings.json`'a tıklanır ve konfigürasyon dosyası açılır. Action Buttons'ta bir butonun konfigürasyonu 

{
                "name": "Make and Flash ",
                "color": "white",
                "command": "make && lm4flash gcc/${fileBasenameNoExtension}.bin",
            }

şeklindedir. Burada `name` butonda yazacak olan yazı, `color` yazının rengi, `command` ise butona basılması durumunda çalıştırılacak komuttur. Örnekteki komut örnek olarak blinky.c dosyasının açık olduğu durumda projenin ana klasöründe `make` komutunu çalıştırıp Makefile ile derleyip Makefile içeriği yönergesinde bunu gcc'nin altına projeismi.bin şeklinde kaydedecek, ardından lm4flash ile bu .bin dosyasını Tiva C'ye flaşlayacaktır.

Açılacak settings.json dosyasına syntax yönergesinde istenilen butonlar eklenip sol alttaki `Refreshes the action buttons` tooltipli ve reload ikonuna sahip olan reload butonuna tıklanılır.

### Tiva C Toolchaini


