
                                   Ghost 使用详解  

--------------------------------------------------------------------------------

一、分区备份

　　使用Ghost进行系统备份，有整个硬盘（Disk）和分区硬盘（Partition）两种方式。在菜单中点击 Local（本地）项，在右面弹出的菜单中有3个子项，其中 Disk表示备份整个硬盘（即克隆）、Partition 表示备份硬盘的单个分区、Check 表示检查硬盘或备份的文件，查看是否可能因分区、硬盘被破坏等造成备份或还原失败。分区备份作为个人用户来保存系统数据，特别是在恢复和复制系统分区时具有实用价值。
　　选 Local→Partition→To Image 菜单，弹出硬盘选择窗口，开始分区备份操作。点击该窗口中白色的硬盘信息条，选择硬盘，进入窗口，选择要操作的分区（若没有鼠标，可用键盘进行操作：TAB键进行切换，回车键进行确认，方向键进行选择）。 在弹出的窗口中选择备份储存的目录路径并输入备份文件名称，注意备份文件的名称带有 GHO 的后缀名。 接下来，程序会询问是否压缩备份数据，并给出3个选择：No 表示不压缩，Fast表示压缩比例小而执行备份速度较快，High 就是压缩比例高但执行备份速度相当慢。最后选择 Yes 按钮即开始进行分区硬盘的备份。Ghost 备份的速度相当快，不用久等就可以完成，备份的文件以 GHO 后缀名储存在设定的目录中。


二、硬盘克隆与备份

　　硬盘的克隆就是对整个硬盘的备份和还原。选择菜单Local→Disk→To Disk，在弹出的窗口中选择源硬盘（第一个硬盘），然后选择要复制到的目标硬盘（第二个硬盘）。注意，可以设置目标硬盘各个分区的大小，Ghost 可以自动对目标硬盘按设定的分区数值进行分区和格式化。选择 Yes 开始执行。
　　Ghost 能将目标硬盘复制得与源硬盘几乎完全一样，并实现分区、格式化、复制系统和文件一步完成。只是要注意目标硬盘不能太小，必须能将源硬盘的数据内容装下。 
　　Ghost 还提供了一项硬盘备份功能，就是将整个硬盘的数据备份成一个文件保存在硬盘上（菜单 Local→Disk→To Image），然后就可以随时还原到其他硬盘或源硬盘上，这对安装多个系统很方便。使用方法与分区备份相似。


三、备份还原

　　如果硬盘中备份的分区数据受到损坏，用一般数据修复方法不能修复，以及系统被破坏后不能启动，都可以用备份的数据进行完全的复原而无须重新安装程序或系统。当然，也可以将备份还原到另一个硬盘上。 
　　要恢复备份的分区，就在界面中选择菜单Local→Partition→From Image，在弹出窗口中选择还原的备份文件，再选择还原的硬盘和分区，点击 Yes 按钮即可。 


四、局域网操作

    LPT 是通过并口传送备份文件,下面有两个选项：slave 和 master, 分别用以连接主机和客户机。 网络基本输入输出系统 NetBios 和 LPT 相似, 也有 slave 和 master 两个选项, 作用与 LPT 相同。
    先和平时一样将要 ghost 的分区做成一个 *.gho 文件，再在一台 win98 上安装Symantec Ghost 企业版，重启。 
    1. 首先制作一张 ghost 带网卡驱动的启动盘。Start > Programs > Symantec Ghost > Ghost Boot Wizard－>Network Boot Disk 如果你的网卡在列表内直接选择它就可以生成一张带 PC-DOS 的启动盘。（但 6.5版的生成的软盘经常有问题，不能成功启动）如果你的网卡不在列表内，你要建立专用的 Packet Driver。ADD->Packet Driver (网卡的驱动程序中有)往下根据提示一步一步走，填入工作站的 ip（ghost 一定要 tcp/ip 协议）。最后生成一张软盘，但此软盘仍不能使用，要改 autoexec.bat 文件在 net xxxx.dos 后面加一个16进制的地址，如 0X75 等。多台计算机只需改 wattcp.cfg 文件中的 ip 即可: 
            IP = 192.168.100.44 
            NETMASK = 255.255.255.0 
            GATEWAY = 192.168.100.1 
    2. 在 server 端运行 multicast server 出来的画面。先给 server一个Session Name（别名）如：bb，再选择 image file 就是你的 gho 文件。然后 －>Dump From Client->rtitions->More Options-> 在 auto start 的 client 中填入 50（如果你要同时复制50台）->accept client 就算完成了，当你的工作站数达到50台时，server就自动传送*.gho 文件。

    3.详述：
    目前，相当多的电子教室都采用了没有软驱、光驱的工作站。在没有软驱、光驱的情况下，当硬盘的软件系统出现问题时，能否实现网络硬盘克隆呢？PXE（Preboot Execution Environment，它是基于 TCP/IP、DHCP、TFTP 等 Internet 协议之上的扩展网络协议）技术提供的从网络启动的功能，让我们找到了解决之道。下面，我们就来讲解怎样采用Ghost 7.0来实现基于 PXE 的网络硬盘克隆。

　　网络硬盘克隆过程简述

　　网络硬盘克隆过程为：在装有软驱的工作站上，用一张引导盘来启动机器，连接到服务器，使用 Ghost 多播服务（Multicast Server）将硬盘或分区的映像克隆到工作站，这样就实现了不拆机、安全、快速的网络硬盘克隆。

　　实现 PXE 网络启动方式

　　对于没有软驱、光驱的工作站，要实现PXE网络启动方式，需要完成三个步骤：

　　1、工作站的PXE启动设置

　　PXE网络启动一般要求在网卡上加装 PXE 启动芯片（PXE Boot ROM）；对于某些型号的网卡，也可以将 PXE 启动代码（Boot Code）写入主板的 Flash ROM；而一些主板上集成了网卡的品牌机（例如清华同方的商用机），可直接支持PXE启动。

　　常用的 RTL8139 芯片的网卡，其 PXE 启动设置方式是：机器启动时根据屏幕提示按下Shift+F10，在启动类型中选择PXE，开启网络启动选项即可。

　　2、制作 PXE 启动文件

　　制作 PXE 的启动文件，推荐使用 3Com 的 DABS（Dynamic Access Boot Services）。DABS 提供了功能强大的 PXE 启动服务、管理功能，但是，网上可供下载的是一个30天的试用版。所以，我们只用它的启动映像文件制作功能，而由 Windows 2000 Server 的 DHCP 服务器来提供 PXE 启动服务。

　　DABS 可以安装在任何一台运行 Windows 的机器上。安装后，运行 3Com Boot Image Editor，出现主界面图。选择“创建TCP/IP或PXE映像文件（Create a TCP/IP or PXE image file）”，出现对话窗口。为即将建立的映像文件命名，例如：pxeghost.img，其他采用默认选项，将经测试正常的网络启动盘放入软驱，选择[OK]，创建PXE启动映像 Pxeghost.img文件。

　　在 3Com Boot Image Editor 的主菜单中，选择“创建PXE菜单启动文件（Creat a PXE menu boot file）”，在出现的窗口中选择[添加（Add）]，加入我们刚刚创建的启动映像文件Pxeghost.img，在“选项（Options）”标签中可以设置菜单标题和等待时间。

　　选择[保存（Save）]，给保存的PXE菜单启动文件命名为 Pxemenu.pxe。

　　3、服务器的PXE启动服务设置

　　Windows 2000 Server 的 DHCP 服务支持两种启动协议：DHCP 和 BOOTP。我们可以设定以下三种选择：仅 DHCP、仅 BOOTP、两者。如果我们的局域网中由其他的 DHCP 服务器提供动态 IP 地址分配，那么这里选“仅BOOTP”即可；如果需要这台服务器提供动态 IP 地址分配，则需要选“两者”。

　　接下来，设置启动文件名。在DHCP服务器的作用域选项中配置选项“067:启动文件名”，字串值为我们创建的 PXE 菜单启动文件名 Pxemenu.pxe。注意：文件名不包含路径。

　　DHCP 服务器只是将启动文件名通知给 BOOTP 客户机，客户机通过什么方式下载启动文件呢？答案是，需要 TFTP 服务。3Com 的 DABS 包含了一个 TFTP 服务组件，当然，也可以下载一个免费的 TFTP 服务器软件长期使用。

　　在 TFTP 服务器的设置中，规定一个服务目录。将制作的 PXE 启动文件 Pxeghost.img、Pxemenu.pxe 放到 TFTP 的服务目录中。TFTP 服务器设置为自动运行。

　　用 Ghost 多播克隆硬盘

　　现在运行 Ghost 多播服务器，任务名称为 Restore。设置完毕，按下[接受客户（Accept Clients）]按钮。启动要接受硬盘克隆的无软驱工作站，如果以上步骤操作无误，应该能够实现 PXE 启动，加入到多播克隆的任务当中。所有的目标工作站连接到本次任务之后，按下[发送（Send）]按钮，开始克隆任务。

五、参数设置

    在 Options 中可以设置参数。下面简单介绍一下:
    1．image write buffering：在建立备份文件时, 打开写缓冲；
    2．sure：选择此项后, 不再会出现最终确认询问 (建议不要选择此项)；
    3．no int 13：选择此项后, 不支持中断 13 (缺省时不选择)；
    4．reboot：在对硬盘或者分区操作完成之后, 自动重启计算机；
    5．spanning：通过多个卷架构备份文件 (选择此项时, 关闭 write buffering)；
    6．autoname：自动为 spanning 文件命名；
    7．allow 64k fat clusters：允许使用 64K FAT 簇 (仅在 Windows NT 中支持)；
    8．ignore CRC errors：忽略 CRC 错误；
    9．override size limit：如果出现分区大小不相配, 可忽略执行；
    10．image read buffering：打开生成备份文件时的读缓存 (缺省时选中此项)。


六、软件特性

1.存贮介质
　　Ghost 支持的存储介质超出了我们的想象，它支持对等 LPT 接口、对等 USB 接口、对等 TCP/IP 接口、SCSI磁带机、便携式设备（JAZ、ZIP、MO等）、光盘刻录机（CDR、CDRW）等。而这些特性不需要任何外带的驱动程序和软件，只需一张软盘就可以做到！特别是对光盘刻录机的支持，如今的刻录机和空白光盘都十分便宜，非常适合作备份的用途。 

2.兼容性 
　　Ghost 对现有的操作系统都有良好的支持，包括 FAT16、FAT32、NTFS、HPFS、UNIX、NOVELL 等文件存储格式。同以前版本不同的是，Ghost 2001 加入了对 Linux EX2的支持（FIFO 文件存储格式），这也就意味着 Linux 的用户也可以用 Ghost 来备份系统了。 

3.配套软件

　　A.Ghost 浏览器
    在以前的 Ghost版本中，我们只能对整个系统进行简单的备份、复制、还原，要恢复单个的文件和文件夹还要使用外带的 GhostEXP 软件。现在，Symantec 公司已经将 Ghost 浏览器整合在软件中。Ghost 浏览器采用类似于资源管理器的界面，通过它，我们可以方便迅速地在备份包中找出我们想要的文件和文件夹并还原。
    使用Explorer可以备份整个硬盘或单个硬盘分区，点击工具栏上的圆柱形图标，弹出硬盘或分区选择对话窗口，然后再选择备份文件的储存目录并输入名称即可完成。要注意的是，非注册用户不能使用备份这项功能。
    在 Ghost Explorer 中管理硬盘备份文件就非常方便了。首先选择打开一个备份文件(File/Open)，这时备份中的文件就像资源管理器一样在程序界面窗口中列出，可以在其中非常方便地查看、打开文件，也可以查找文件，或者将某个文件删除(但不能删除目录)。
    在 Ghost Explorer 中提供了多种还原硬盘备份文件的方法，最方便的方法是使用鼠标右键点击某个文件，在弹出菜单中选择 Restore，然后输入要还原到的目录，这样，单个文件就从整个磁盘备份中还原出来了。当然，如果要还原整个磁盘备份，只需选择左面目录列表栏中最上面的带磁盘图标的目录项，然后点击工具栏中的还原图标 (第二个) 就可以了。

    B.GDisk
    GDisk 是一个新加入的实用工具，它彻底取代了 FDisk 和 Format，功能有： 
    * 快速格式化。
    * 隐藏和显示分区。此功能允许一个以上的主 DOS分区，并且每个分区上的操作系统有不同的版本。隐藏分区的能力使计算机习惯于引导到选定的可引导分区，忽略其他隐藏分区中相同操作系统的安装。 
    * 全面的分区报告。 
    * 高度安全的磁盘擦除。提供符合美国国防部标准和更高安全标准的磁盘擦除选项。 
    与使用交互式菜单的 FDisk 不同，GDisk是由命令行驱动的。这提供了更快的配置磁盘分区和在批处理文件中定义 GDisk操作的能力。但与此同时，几十个参数会令普通用户头疼，因此笔者不推荐一般用户使用，Symantec 公司也应该推出相应的GUI（图形用户界面）控制台以方便用户使用。具体的参数说明可以用命令行 gdisk/? 了解。

    C.Live Update
    Live Update 是 Symantec公司软件的一个通用升级程序，它能够检查当前系统中已安装的 Symantec 软件，并且通过英特网对软件进行在线升级。 
在安装 Ghost 2001 时，安装程序自动升级了 Live Update 程序的版本。


七、命令行参数：（Ghost 的无人 备份/恢复/复制 操作）

　　其实 Ghost 2001 的功能远远不止它主程序中显示的那些，Ghost 可以在其启动的命令行中添加众多参数以实现更多的功能。命令行参数在使用时颇为复杂，不过我们可以制作批处理文件，从而“一劳永逸”（类似于无人安装 Windows 98 和Windows 2000）。现在让我们来了解一些常用的参数（了解更加详细的参数介绍可查看 Ghost 的帮助文件）。 
    1.-rb 
    本次 Ghost 操作结束退出时自动重启。这样，在复制系统时就可以放心离开了。 
    2.-fx 
    本次 Ghost 操作结束退出时自动回到DOS提示符。 
    3.-sure 
    对所有要求确认的提示或警告一律回答“Yes”。此参数有一定危险性，只建议高级用户使用。 
    4.-fro 
    如果源分区发现坏簇，则略过提示而强制拷贝。此参数可用于试着挽救硬盘坏道中的数据。
    5.@filename 
    在 filename 中指定 txt 文件。txt文件中为 Ghost 的附加参数，这样做可以不受DOS命令行 150 个字符的限制。 
    6.-f32 
    将源 FAT16 分区拷贝后转换成 FAT32（前提是目标分区不小于 2G）。WinNT 4 和Windows95、97用户慎用。 
    7.-bootcd 
    当直接向光盘中备份文件时，此选项可以使光盘变成可引导。此过程需要放入启动盘。 
    8.-fatlimit 
    将 NT 的 FAT16 分区限制在 2G。此参数在复制 Windows NT 分区，且不想使用64k/簇的 FAT16 时非常有用。 
    9.-span 
    分卷参数。当空间不足时提示复制到另一个分区的另一个备份包。
    10.-auto 
    分卷拷贝时不提示就自动赋予一个文件名继续执行。 
    11.-crcignore 
    忽略备份包中的 CRC ERROR。除非需要抢救备份包中的数据，否则不要使用此参数，以防数据错误。 
    12.-ia 
    全部映像。Ghost 会对硬盘上所有的分区逐个进行备份。 
    13.-ial 
    全部映像，类似于 -ia 参数，对 Linux 分区逐个进行备份。 
    14.-id 
    全部映像。类似于 -ia 参数，但包含分区的引导信息。 
    15.-quiet 
    操作过程中禁止状态更新和用户干预。 
    16.-script 
    可以执行多个 Ghost 命令行。命令行存放在指定的文件中。
    17.-split=x 
　　将备份包划分成多个分卷，每个分卷的大小为 x兆。这个功能非常实用，用于大型备份包复制到移动式存储设备上，例如将一个 1.9G 的备份包复制到 3 张刻录盘上。 
    18.-z 
　　将磁盘或分区上的内容保存到映像文件时进行压缩。-z 或 -z1 为低压缩率（快速）；-z2 为高压缩率（中速）；-z3 至 -z9 压缩率依次增大（速度依次减慢）。 
    19.-clone 
　　这是实现 Ghost 无人备份/恢复的核心参数。使用语法为： 
-clone,MODE=(operation),SRC=(source),DST=(destination),[SZE(size),SZE(size)...] 
    此参数行较为复杂，且各参数之间不能含有空格。其中 operation意为操作类型，值可取：copy：磁盘到磁盘；load：文件到磁盘；dump：磁盘到文件；pcopy：分区到分区；pload：文件到分区；pdump：分区到文件。
　　Source 意为操作源，值可取：驱动器号，从1开始；或者为文件名，需要写绝对路径。 
    Destination 意为目标位置，值可取：驱动器号，从 1开始；或者为文件名，需要写绝对路径；@CDx，刻录机，x 表示刻录机的驱动器号，从1开始。

    下面举例说明：

1.命令行参数：ghostpe.exe -clone,mode=copy,src=1,dst=2 
完成操作：将本地磁盘1复制到本地磁盘2。

2.命令行参数：ghostpe.exe -clone,mode=pcopy,src=1:2,dst=2:1 
完成操作：将本地磁盘1上的第二分区复制到本地磁盘2的第一分区。

3.命令行参数：ghostpe.exe-clone,mode=load,src=g:\3prtdisk.gho,dst=1,sze1=450M,sze2=1599M,sze3=2047M 
完成操作：从映像文件装载磁盘1，并将第一个分区的大小调整为450MB，第二个调整为1599MB，第三个调整为2047MB。

4.命令行参数：ghostpe.exe -clone,mode=pdump,src2:1:4:6,dst=d:\prt246.gho 
完成操作：创建仅含有选定分区的映像文件。从磁盘2上选择分区1、4、6。


八、一些示例

ghost.exe -clone,mode=copy,src=1,dst=2 -sure
硬盘对拷

ghost.exe -clone,mode=pcopy,src=1:2,dst=2:1 -sure
将一号硬盘的第二个分区复制到二号硬盘的第一个分区

ghost.exe -clone,mode=pdump,src=1:2,dst=g:\bac.gho
将一号硬盘的第二个分区做成映像文件放到 g 分区中

ghost.exe -clone,mode=pload,src=g:\bac.gho:2,dst=1:2
从内部存有两个分区的映像文件中，把第二个分区还原到硬盘的第二个分区

ghost.exe -clone,mode=pload,src=g:\bac.gho,dst=1:1 -fx -sure -rb
用 g 盘的 bac.gho 文件还原 c 盘。完成后不显示任何信息，直接启动

ghost.exe -clone,mode=load,src=g:\bac.gho,dst=2,SZE1=60P,SZE2=40P
将映像文件还原到第二个硬盘，并将分区大小比例修改成 60:40

自动还原磁盘：
    首先做一个启动盘，包含 Config.sys, Autoexec.bat, Command.com, Io.sys, Ghost.exe 文件(可以用 windows 做启动盘的程序完成)。Autoexec.bat 包含以下命令：
Ghost.exe -clone,mode=pload,src=d:\bac.gho,dst=1:1 -fx -sure -rb
    利用在 D 盘的文件自动还原，结束以后自动退出 ghost 并且重新启动。
 
自动备份磁盘：
    ghost.exe -clone,mode=pdump,src=1:1,dst=d:\bac.gho -fx -sure -rb

自动还原光盘：
    包含文件：Config.sys, Autoexec.bat, Mscdex.exe (CDROM 执行程序), Oakcdrom.sys (ATAPI CDROM 兼容驱动程序), Ghost.exe。
    Config.sys 内容为：
DEVICE=OAKCDROM.SYS /D:IDECD001
    Autoexec.bat 内容为：
MSCDEX.EXE /D:IDECE001 /L:Z
Ghost -clone,mode=load,src=z:\bac.gho,dst=1:1 -sure -rb

可以根据下面的具体说明修改示例：

1.-clone

-clone 在使用时必须加入参数，它同时也是所有的 switch{batch switch} 里最实用的。下面是 clone 所定义的参数：

mode={copy|load|dump|pcopy|pload|pdump},
src={drive|file|driveartition},
dst={drive|file|driveartition} 

mode 指定要使用哪种 clone 所提供的命令 
copy 硬盘到硬盘的复制 (disk to disk copy) 
load 文件还原到硬盘 (file to disk load) 
dump 将硬盘做成映像文件 (disk to file dump) 
pcopy 分区到分区的复制 (partition to partition copy) 
pload 文件还原到分区 (file to partition load) 
pdump 分区备份成映像文件（partition to file dump)
 
src 指定了 ghost 运行时使用的源分区的位置模式及其意义。对应 mode 命令 src 所使用参数例子:
COPY/DUMP 源硬盘号。以 1 代表第一号硬盘
LOAD 映像文件名。g:/back98/setup98.gho 或装置名称 (drive）
PCOPY/PDUMP 源分区号。1:2 代表的是硬盘１的第二个分区
PLOAD 分区映像文件名加上分区号或是驱动器名加上分区号。g:\back98.gho:2 代表映像文件里的第二个分区 

dst 指定运行 Ghost 时使用的目标位置模式及其意义。对应 mode 命令 dst 所使用参数例子： 
COPY/DUMP 目的硬盘号。2 代表第二号硬盘
LOAD 硬盘映像文件名。例 g:\back98\setup98.gho 
PCOPY/PLOAD 目的分区号。2:2 代表硬盘 2 的第二个分区
PDUMP 分区映像文件名加分区号。g:\back98\setup98.gho:2 
SZEn 指定所使用目的分区的大小：
n=xxxxM 指定第 n 目的分区的大小为 xxxxMB。如 SZE2=800M 表示分区 2 的大小为 800MB 
n=mmP 指定第 n 目的分区的大小为整个硬盘的 mm 个百分比。

2.-fxo 当源物件出现坏块时，强迫复制继续进行

3.-fx 当ghost完成新系统的工作后不显示 press ctrl-alt-del to reboot 直接回到DOS下

4.-ia 完全执行扇区到扇区的复制。当由一个映像文件或由另一个硬盘为来源，复制一个分区时，Ghost将首先检查来源分区，再决定是要复制文件和目录结构还是要做映像复制(扇区到扇区)。预设是这种形式。但是有的时候，硬盘里特定的位置可能会放一些隐藏的与系统安全有关的文件。只有用扇区到扇区复制的方法才能正确复制

5.-pwd and -pwd=x 给映像文件加密 

6.-rb 在还原或复制完成以后，让系统重新启动 

7.-sure 可以和 clone 合用。Ghost 不会显示 proceed with disk clone-destination drive will be overwritten? 提示信息 


九、注意事项

1.在备份系统时，单个的备份文件最好不要超过 2GB。 
2.在备份系统前，最好将一些无用的文件删除以减少Ghost文件的体积。通常无用的文件有：Windows 的临时文件夹、IE 临时文件夹、Windows 的内存交换文件。这些文件通常要占去100 多兆硬盘空间。 
3.在备份系统前，整理目标盘和源盘，以加快备份速度。 
4.在备份系统前及恢复系统前，最好检查一下目标盘和源盘，纠正磁盘错误。 
5.在恢复系统时，最好先检查一下要恢复的目标盘是否有重要的文件还未转移，千万不要等硬盘信息被覆盖后才后悔莫及啊。 
6.在选择压缩率时，建议不要选择最高压缩率，因为最高压缩率非常耗时，而压缩率又没有明显的提高。 
7.在新安装了软件和硬件后，最好重新制作映像文件，否则很可能在恢复后出现一些莫名其妙的错误。