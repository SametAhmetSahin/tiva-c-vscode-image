# tiva-c-vscode-image


Creation of a modern system image for the System Programming class of the Computer Engineering programme of the Kocaeli University. 


<!---

Creating a modern system image for the System Programming class of the Computer Engineering programme of the Kocaeli University. 

After following the previous Linuxer's system image creation guide (until the GNU MCU Eclipse) and creating a base Debian XFCE installation, I decided to look into using VSCode and I apparently could, if I used VSCode as the text editor and the GUI for the commands that will make and flash the projects in the background. The guide I mentioned is: https://github.com/KOU-Embedded-System-Lab/os-base-image/tree/master/debian

I found a GitHub repository where the Tiva C board toolchain (distributed with Texas Code Composer Studio) was uploaded and cloned it. According to the usage instructions I could just go into a project, run 'make' to build the project and flash the .bin file located in the 'gcc' folder, using 'lm4flash'. And it worked.
But your average student would not know about Linux and it could provide a huge difficulty curve for a fresh student to use a terminal, and I have discovered a VSCode addon called 'VsCode Action Buttons' by 'Seun LanLege', and saw how easy it was to create custom buttons to run custom commands. The user's settings.json is modified to include the custom commands and the syntax is something like:

--->

## English
#TODO

## Türkçe

### Proje Hakkında

Projenin Linux'ta olmasının sağladığı büyük avantaj iki tane komut çalıştırılarak projenin derlenip flaşlanabilmesi. Arkada tüm işi `make` komutu ile çalıştırılan Makefile'lar ve `lm4flash` ile flaşlamak yönetiyor. VSCode burada bir nevi ön yüz görevi görüyor. Sektörde popülerleştiği için VSCode'un uygun bir seçim olduğunu düşündüm.

### Özetle Ne Yapılır

https://github.com/KOU-Embedded-System-Lab/os-base-image/tree/master/debian adresinde Kocaeli Üniversitesi Bilgisayar Mühendisliği bölümünde Sistem Programlama dersinde 2018'den beri kullanılan Eclipse imajının hazırlanması için talimatlar bulunur. Bu talimatlar GNU MCU Eclipse başlığına kadar takip edilip temel bir Debian kurulumu oluşturulur. Ardından aşağıda belirtilen gerekli paketleri kurulur, sonrasında VSCode indirilip kurulur, kullanılacak olan eklenti kurulur ve ayarlanılır, ardından toolchain indirilip örnek projelerden biri Tiva C'ye flaşlanır ve geliştirme ortamının kurulumunun başarılı olduğuna emin olunur.

### Çabuk Kullanım

Releases kısmından debian-kou-embedded-v2021-12-07.ova dosyası indirilir ve VirtualBox'ta içe aktarılır. Ardından çalıştırılır, sonra masaüstünden VSCode açılır.
VSCode'da Open Folder komutu ile proje klasörü açılır, o andan itibaren proje geliştirmeye hazırdır, aşağıdaki Make and Flash butonuyla derlenip Tiva C'ye flaşlanabilir.

### Kurulan Paketler
Debian kurulumunun ardından komut satırından itibaren kurulan tüm paketler şunlar:

`xfce4 xfce4-goodies bash-completion linux-headers-amd64 firmware-linux gcc make gcc-arm-none-eabi gdb-multiarch lm4flash elinks git`

Ardından VirtualBox'ın sunduğu iso ile VirtualBox Guest Additions kurulur.

### VSCode Kurulumu ve Ayarlaması

elinks bir komut satırı tarayıcısıdır. `elinks url` şeklinde çalıştırılabilir. VSCode'u indirmek için `elinks https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64` komutu çalıştırılır ve indirmeye onay verilir. İndirmenin ardından .deb paketinden `sudo dpkg --install vscodepaketiismi.deb` ile VSCode kurulur. Ardından VSCode açılır ve geliştiricisi Seun LanLege olan `VsCode Action Buttons` eklentisini kurulur. Eklentinin yanındaki dişliye, oradan `Extension Settings`'e, oradan da `Edit in settings.json`'a tıklanır ve konfigürasyon dosyası açılır. Action Buttons'ta bir butonun konfigürasyonu 

    {
                "name": "Make and Flash ",
                "color": "white",
                "command": "make && lm4flash gcc/${fileBasenameNoExtension}.bin",
            }

şeklindedir. Burada `name` butonda yazacak olan yazı, `color` yazının rengi, `command` ise butona basılması durumunda çalıştırılacak komuttur. Örnekteki komut örnek olarak blinky.c dosyasının açık olduğu durumda projenin ana klasöründe `make` komutunu çalıştırıp Makefile ile derleyip Makefile içeriği yönergesinde bunu gcc'nin altına projeismi.bin şeklinde kaydedecek, ardından lm4flash ile bu .bin dosyasını Tiva C'ye flaşlayacaktır.

Açılacak settings.json dosyasına syntax yönergesinde istenilen butonlar eklenip sol alttaki `Refreshes the action buttons` tooltipli ve reload ikonuna sahip olan reload butonuna tıklanılır.

#### VsCode Action Buttons syntaxı
VSCode'da kullanıcının settings.json dosyası içerisine şu konfigürasyon yazılmalıdır

    "actionButtons": {
        "loadNpmCommands":false, // npm komutlarının otomatik oluşturulmasını devre dışı bırakır.
        "commands": [ // buraya alt kısımda çıkacak olan butonların her biri bir eleman olarak eklenilir
            {
                "name": "Make and Flash ", // Make and Flash komutunun ismi, bu komut projeyi derler ve flaşlar. İsimler değiştirilebilir.
                "color": "white", // Renk
                "command": "make && lm4flash gcc/${fileBasenameNoExtension}.bin", // Çalıştırılacak komut
                // ${fileBasenameNoExtension} açık olan dosyanın uzantısız ismidir, örnek olarak `blinky.c` dosyası açıksa ${fileBasenameNoExtension} blinky'dir, gcc klasörünün içinde bulunacak olan .bin dosyasının ismi de proje klasörünün ismine bağlıdır.
            },
            {
                "name": "Create New Project", // Create New Project scripti, 
                "color": "white",
                "singleInstance": true, // Aynı anda tek bir komutun çalışmasını sağlar, birden fazla çalıştırmaya izin vermez
                "command": "echo 'please input the name of the new project:' && read x && sh /home/student/create_new_project.sh $x", // create_new_project.sh henüz bitmiş durumda değildir.
            }
        ]
    }

### Tiva C Toolchaini

https://github.com/yuvadm/tiva-c adresinde Texas Instruments'in kendi toolchaini olan TivaWare GitHub'a yüklenmiş halde bulunur. `git clone https://github.com/yuvadm/tiva-c` komutu ile bulunan klasörün içerisine klonlandıktan sonra yereldeki `tiva-c` klasörünün içerisinde `boards` klasörünün içerisinde Tiva C'nin kod numarasıyla (`ek-tm4c123gxl`) isimlendirilmiş klasörün içerisinde her birinin kendi Makefile'ı bulunan örnek projeler bulunmaktadır. `tiva-c` klasörünün içerisinde `inc`, `usblib` ve benzeri gereken tüm klasörler bulunmaktadır.

### Create New Project scripti
Kendi yazdığım bu bash scripti kullanıcıdan proje ismini girdi olarak alıp ve temel projemizde gereken kelimeleri değiştirerek yeni bir proje oluşturmaktadır. Sözkonusu script `create_new_project.sh` adıyla bu repoda bulunacaktır. 