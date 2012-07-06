名字→grep
版本→2.5.1
;类型中| 1 网络 | 2 文件工作 | 3 系统 | 4 服务器 | 5 多媒体 | 6 其他 | 
类型→2→文字查找
简介→grep 是文字查找抽取软件
相关url→

$→$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

详细介绍和用法: 

grep 命令使用详解

1. grep简介
grep （global search regular expression(RE) and print out the line,全面搜索正则表达式并把行打印出来）是一种强大的文本搜索工具，它能使用正则表达式搜索文本，并把匹配的行打印出来。Unix的grep家族包括grep、egrep和fgrep。egrep和fgrep的命令只跟grep有很小不同。egrep是grep的扩展，支持更多的re元字符， fgrep就是fixed grep或fast grep，它们把所有的字母都看作单词，也就是说，正则表达式中的元字符表示回其自身的字面意义，不再特殊。linux使用GNU版本的grep。它功能更强，可以通过-G、-E、-F命令行选项来使用egrep和fgrep的功能。

grep的工作方式是这样的，它在一个或多个文件中搜索字符串模板。如果模板包括空格，则必须被引用，模板后的所有字符串被看作文件名。搜索的结果被送到屏幕，不影响原文件内容。

grep可用于shell脚本，因为grep通过返回一个状态值来说明搜索的状态，如果模板搜索成功，则返回0，如果搜索不成功，则返回1，如果搜索的文件不存在，则返回2。我们利用这些返回值就可进行一些自动化的文本处理工作。

2. grep正则表达式元字符集（基本集）
^
锚定行的开始 如：'^grep'匹配所有以grep开头的行。 

$
锚定行的结束 如：'grep$'匹配所有以grep结尾的行。 

.
匹配一个非换行符的字符 如：'gr.p'匹配gr后接一个任意字符，然后是p。 

*
匹配零个或多个先前字符 如：'*grep'匹配所有一个或多个空格后紧跟grep的行。 .*一起用代表任意字符。

[]
匹配一个指定范围内的字符，如'[Gg]rep'匹配Grep和grep。 

[^]
匹配一个不在指定范围内的字符，如：'[^A-FH-Z]rep'匹配不包含A-R和T-Z的一个字母开头，紧跟rep的行。 

\(..\)
标记匹配字符，如'\(love\)'，love被标记为1。 

\<
锚定单词的开始，如:'\<grep'匹配包含以grep开头的单词的行。 

\>
锚定单词的结束，如'grep\>'匹配包含以grep结尾的单词的行。 

x\{m\}
重复字符x，m次，如：'0\{5\}'匹配包含5个o的行。 

x\{m,\}
重复字符x,至少m次，如：'o\{5,\}'匹配至少有5个o的行。 

x\{m,n\}
重复字符x，至少m次，不多于n次，如：'o\{5,10\}'匹配5--10个o的行。

\w
匹配文字和数字字符，也就是[A-Za-z0-9]，如：'G\w*p'匹配以G后跟零个或多个文字或数字字符，然后是p。

\W
\w的反置形式，匹配一个或多个非单词字符，如点号句号等。

\b
单词锁定符，如: '\bgrepb\'只匹配grep。

3. 用于egrep和 grep -E的元字符扩展集
+
匹配一个或多个先前的字符。如：'[a-z]+able'，匹配一个或多个小写字母后跟able的串，如loveable,enable,disable等。

?
匹配零个或多个先前的字符。如：'gr?p'匹配gr后跟一个或没有字符，然后是p的行。

a|b|c
匹配a或b或c。如：grep|sed匹配grep或sed

()
分组符号，如：love(able|rs)ov+匹配loveable或lovers，匹配一个或多个ov。

x{m},x{m,},x{m,n}
作用同x\{m\},x\{m,\},x\{m,n\}

4. POSIX字符类
为了在不同国家的字符编码中保持一至，POSIX(The Portable Operating System Interface)增加了特殊的字符类，如[:alnum:]是A-Za-z0-9的另一个写法。要把它们放到[]号内才能成为正则表达式，如[A- Za-z0-9]或[[:alnum:]]。在linux下的grep除fgrep外，都支持POSIX的字符类。

[:alnum:]
文字数字字符

[:alpha:]
文字字符

[:digit:]
数字字符

[:graph:]
非空字符（非空格、控制字符）

[:lower:]
小写字符

[:cntrl:]
控制字符

[:print:]
非空字符（包括空格）

[:punct:]
标点符号

[:space:]
所有空白字符（新行，空格，制表符）

[:upper:]
大写字符

[:xdigit:]
十六进制数字（0-9，a-f，A-F）

5. Grep命令选项
-?
同时显示匹配行上下的？行，如：grep -2 pattern filename同时显示匹配行的上下2行。

-b，--byte-offset
打印匹配行前面打印该行所在的块号码。

-c,--count
只打印匹配的行数，不显示匹配的内容。

-f File，--file=File
从文件中提取模板。空文件中包含0个模板，所以什么都不匹配。

-h，--no-filename
当搜索多个文件时，不显示匹配文件名前缀。

-i，--ignore-case
忽略大小写差别。

-q，--quiet
取消显示，只返回退出状态。0则表示找到了匹配的行。

-l，--files-with-matches
打印匹配模板的文件清单。

-L，--files-without-match
打印不匹配模板的文件清单。

-n，--line-number
在匹配的行前面打印行号。

-s，--silent
不显示关于不存在或者无法读取文件的错误信息。

-v，--revert-match
反检索，只显示不匹配的行。

-w，--word-regexp
如果被\<和\>引用，就把表达式做为一个单词搜索。

-V，--version
显示软件版本信息。

6. 实例
要用好grep这个工具，其实就是要写好正则表达式，所以这里不对grep的所有功能进行实例讲解，只列几个例子，讲解一个正则表达式的写法。

$ ls -l | grep '^a'
通过管道过滤ls -l输出的内容，只显示以a开头的行。

$ grep 'test' d*
显示所有以d开头的文件中包含test的行。

$ grep 'test' aa bb cc
显示在aa，bb，cc文件中匹配test的行。

$ grep '[a-z]\{5\}' aa
显示所有包含每个字符串至少有5个连续小写字符的字符串的行。

$ grep 'w\(es\)t.*\1' aa
如果west被匹配，则es就被存储到内存中，并标记为1，然后搜索任意个字符（.*），这些字符后面紧跟着另外一个es（\1），找到就显示该行。如果用egrep或grep -E，就不用"\"号进行转义，直接写成'w(es)t.*\1'就可以了










◎grep -- print lines matching a pattern (将符合样式的该行列出) 

 ◎语法: grep [options]  
 PATTERN [FILE...]  
 grep用以在file内文中比对相对应的部分，或是当没有指定档案时，  
 由标准输入中去比对。 在预设的情况下，grep会将符合样式的那一行列出。 

         此外，还有两个程式是grep的变化型，egrep及fgrep。           
         其中egrep就等同於grep -E ，fgrep等同於grep -F 。 

 ◎参数 
    1. -A NUM，--after-context=NUM  
               除了列出符合行之外，并且列出後NUM行。 
              
         ex:   $ grep -A 1 panda file  
               (从file中搜寻有panda样式的行，并显示该行的後1行) 
                                  
    2. -a或--text   
               grep原本是搜寻文字档，若拿二进位的档案作为搜寻的目标， 
               则会显示如下的讯息: Binary file 二进位档名 matches 然後结束。 
                   
               若加上-a参数则可将二进位档案视为文字档案搜寻， 
               相当於--binary-files=text这个参数。 
             
         ex:   (从二进位档案mv中去搜寻panda样式) 
               (错误!!!) 
               $ grep panda mv  
               Binary file mv matches   
               (这表示此档案有match之处，详见--binary-files=TYPE ) 
               $ 
               (正确!!!) 
               $ grep -a panda mv  
        
    3. -B NUM，--before-context=NUM 
               与 -A NUM 相对，但这此参数是显示除符合行之外 
               并显示在它之前的NUM行。         
              
         ex:   (从file中搜寻有panda样式的行，并显示该行的前1行) 
               $ grep -B 1 panda file  

    4. -C [NUM], -NUM, --context[=NUM]   
               列出符合行之外并列出上下各NUM行，预设值是2。 
              
         ex:   (列出file中除包含panda样式的行外并列出其上下2行) 
               (若要改变预设值，直接改变NUM即可) 
               $ grep -C[NUM]  panda file  
              
    5. -b, --byte-offset 
               列出样式之前的内文总共有多少byte .. 
               
          ex:  $ grep -b  panda file   
       显示结果类似於: 
         0:panda 
        66:pandahuang 
       123:panda03 
            
    6. --binary-files=TYPE 
               此参数TYPE预设为binary(二进位)，若以普通方式搜寻，只有2种结果: 
                 1.若有符合的地方：显示Binary file 二进位档名 matches 
                 2.若没有符合的地方：什麽都没有显示。 
                    
               若TYPE为without-match，遇到此参数， 
               grep会认为此二进位档案没有包含任何搜寻样式，与-I 参数相同。 
                    
               若TPYE为text, grep会将此二进位档视为text档案，与-a 参数相同。 
         
     Warning: --binary-files=text 若输出为终端机，可能会产生一些不必要的输出。 
               
    7. -c, --count 
       不显示符合样式行，只显示符合的总行数。 
       若再加上-v,--invert-match，参数显示不符合的总行数。 

    8. -d ACTION, --directories=ACTION 
               若输入的档案是一个资料夹，使用ACTION去处理这个资料夹。 
       预设ACTION是read(读取)，也就是说此资料夹会被视为一般的档案； 
       若ACTION是skip(略过)，资料夹会被grep略过： 
       若ACTION是recurse(递)，grep会去读取资料夹下所有的档案， 
       此相当於-r 参数。 

    9.  -E, --extended-regexp 
       采用规则表示式去解释样式。 
       
   10.  -e PATTERN, --regexp=PATTERN 
       把样式做为一个partern，通常用在避免partern用-开始。   

   11.  -f FILE, --file=FILE 
       事先将要搜寻的样式写入到一个档案，一行一个样式。 
       然後采用档案搜寻。 
       空的档案表示没有要搜寻的样式，因此也就不会有任何符合。 
        
   ex: (newfile为搜寻样式档) 
       $grep -f newfile file     

   12.  -G, --basic-regexp 
       将样式视为基本的规则表示式解释。(此为预设) 

   13.  -H, --with-filename 
       在每个符合样式行前加上符合的档案名称，若有路径会显示路径。 
        
   ex: (在file与testfile中搜寻panda样式)    
       $grep -H panda file ./testfile 
                file:panda 
                ./testfile:panda 
                $ 
      
   14.  -h, --no-filename   
               与-H参数相类似，但在输出时不显示路径。 

   15.  --help  
               产生简短的help讯息。 

   16.  -I 
               grep会强制认为此二进位档案没有包含任何搜寻样式， 
               与--binary-files=without-match参数相同。 
                    
           ex:  $ grep -I  panda mv 

   17.  -i, --ignore-case        
               忽略大小写，包含要搜寻的样式及被搜寻的档案。 
                
           ex:  $ grep -i panda mv 
                 
   18.  -L, --files-without-match  
               不显示平常一般的输出结果，反而显示出没有符合的档案名称。 

   19.  -l, --files-with-matches                
               不显示平常一般的输出结果，只显示符合的档案名称。 

   20.  --mmap                
               如果可能，使用mmap系统呼叫去读取输入，而不是预设的read系统呼叫。  
               在某些状况，--mmap 能产生较好的效能。 然而，--mmap  
               如果运作中档案缩短，或I/O 错误发生时， 
               可能造成未定义的行为(包含core dump)，。 
                
   21.  -n, --line-number 
               在显示行前，标上行号。 
                
            ex:  $ grep -n  panda file   
                显示结果相似於下: 
                行号:符合行的内容 

   22.  -q, --quiet, --silent  
               不显示任何的一般输出。请参阅-s或--no-messages 

   23.  -r, --recursive 
       递地，读取每个资料夹下的所有档案，此相当於 -d recsuse 参数。 

   24.  -s, --no-messages 
       不显示关於不存在或无法读取的错误讯息。 
      
 小: 不像GNU grep，传统的grep不符合POSIX.2协定， 
       因为缺乏-q参数，且他的-s 参数表现像GNU grep的 -q 参数。 
       Shell Script倾向将传统的grep移植，避开-q及-s参数， 
       且将输出限制到/dev/null。 
     
POSIX: 定义UNIX及UNIX-like系统需要提供的功能。               
     
   25.  -V, --version 
  显示出grep的版本号到标准错误。 
  当您在回报有关grep的bugs时，grep版本号是必须要包含在内的。 

   26.  -v, --invert-match 
  显示除搜寻样式行之外的全部。 
                    
   27.  -w, --word-regexp 
          将搜寻样式视为一个字去搜寻，完全符合该"字"的行才会被列出。 

   28.  -x, --line-regexp 
  将搜寻样式视为一行去搜寻，完全符合该"行"的行才会被列出。 









用‘grep’搜索文本文件 
如果您要在几个文本文件中查找一字符串，可以使用‘grep’命令。‘grep’在文本中搜索指定的字符串。
假设您正在‘/usr/src/linux/Documentation’目录下搜索带字符串‘magic’的文件：

$ grep magic /usr/src/linux/Documentation/* 
sysrq.txt:* How do I enable the magic SysRQ key?
sysrq.txt:* How do I use the magic SysRQ key? 

其中文件‘sysrp.txt’包含该字符串，讨论的是 SysRQ 的功能。

默认情况下，‘grep’只搜索当前目录。如果此目录下有许多子目录，‘grep’会以如下形式列出：

grep: sound: Is a directory 

这可能会使‘grep’的输出难于阅读。这里有两种解决的办法：

明确要求搜索子目录：grep -r 
或忽略子目录：grep -d skip 
当然，如果预料到有许多输出，您可以通过 管道 将其转到‘less’上阅读：

$ grep magic /usr/src/linux/Documentation/* | less

这样，您就可以更方便地阅读。

有一点要注意，您必需提供一个文件过滤方式（搜索全部文件的话用 *）。如果您忘了，‘grep’会一直等着，直到该程序被中断。如果您遇到了这样的情况，按 <CTRL c> ，然后再试。

下面是一些有意思的命令行参数：

grep -i pattern files ：不区分大小写地搜索。默认情况区分大小写， 
grep -l pattern files ：只列出匹配的文件名， 
grep -L pattern files ：列出不匹配的文件名， 
grep -w pattern files ：只匹配整个单词，而不是字符串的一部分（如匹配‘magic’，而不是‘magical’）， 
grep -C number pattern files ：匹配的上下文分别显示[number]行， 
grep pattern1 | pattern2 files ：显示匹配 pattern1 或 pattern2 的行， 
grep pattern1 files | grep pattern2 ：显示既匹配 pattern1 又匹配 pattern2 的行。 
这里还有些用于搜索的特殊符号：

\< 和 \> 分别标注单词的开始与结尾。
例如： 
grep man * 会匹配 ‘Batman’、‘manic’、‘man’等， 
grep '\<man' * 匹配‘manic’和‘man’，但不是‘Batman’， 
grep '\<man\>' 只匹配‘man’，而不是‘Batman’或‘manic’等其他的字符串。 
'^'：指匹配的字符串在行首， 
'$'：指匹配的字符串在行尾， 
如果您不习惯命令行参数，可以试试图形界面的‘grep’，如 reXgrep 。这个软件提供 AND、OR、NOT 等语法，还有漂亮的按钮 :-) 。如果您只是需要更清楚的输出，不妨试试 fungrep 。 








◎grep -- print lines matching a pattern (将符合样式的该行列出) 

 ◎语法: grep [options]  
 PATTERN [FILE...]  
 grep用以在file内文中比对相对应的部分，或是当没有指定档案时，  
 由标准输入中去比对。 在预设的情况下，grep会将符合样式的那一行列出。 

         此外，还有两个程式是grep的变化型，egrep及fgrep。           
         其中egrep就等同於grep -E ，fgrep等同於grep -F 。 

 ◎参数 
    1. -A NUM，--after-context=NUM  
               除了列出符合行之外，并且列出後NUM行。 
              
         ex:   $ grep -A 1 panda file  
               (从file中搜寻有panda样式的行，并显示该行的後1行) 
                                  
    2. -a或--text   
               grep原本是搜寻文字档，若拿二进位的档案作为搜寻的目标， 
               则会显示如下的讯息: Binary file 二进位档名 matches 然後结束。 
                   
               若加上-a参数则可将二进位档案视为文字档案搜寻， 
               相当於--binary-files=text这个参数。 
             
         ex:   (从二进位档案mv中去搜寻panda样式) 
               (错误!!!) 
               $ grep panda mv  
               Binary file mv matches   
               (这表示此档案有match之处，详见--binary-files=TYPE ) 
               $ 
               (正确!!!) 
               $ grep -a panda mv  
        
    3. -B NUM，--before-context=NUM 
               与 -A NUM 相对，但这此参数是显示除符合行之外 
               并显示在它之前的NUM行。         
              
         ex:   (从file中搜寻有panda样式的行，并显示该行的前1行) 
               $ grep -B 1 panda file  

    4. -C [NUM], -NUM, --context[=NUM]   
               列出符合行之外并列出上下各NUM行，预设值是2。 
              
         ex:   (列出file中除包含panda样式的行外并列出其上下2行) 
               (若要改变预设值，直接改变NUM即可) 
               $ grep -C[NUM]  panda file  
              
    5. -b, --byte-offset 
               列出样式之前的内文总共有多少byte .. 
               
          ex:  $ grep -b  panda file   
       显示结果类似於: 
         0:panda 
        66:pandahuang 
       123:panda03 
            
    6. --binary-files=TYPE 
               此参数TYPE预设为binary(二进位)，若以普通方式搜寻，只有2种结果: 
                 1.若有符合的地方：显示Binary file 二进位档名 matches 
                 2.若没有符合的地方：什麽都没有显示。 
                    
               若TYPE为without-match，遇到此参数， 
               grep会认为此二进位档案没有包含任何搜寻样式，与-I 参数相同。 
                    
               若TPYE为text, grep会将此二进位档视为text档案，与-a 参数相同。 
         
     Warning: --binary-files=text 若输出为终端机，可能会产生一些不必要的输出。 
               
    7. -c, --count 
       不显示符合样式行，只显示符合的总行数。 
       若再加上-v,--invert-match，参数显示不符合的总行数。 

    8. -d ACTION, --directories=ACTION 
               若输入的档案是一个资料夹，使用ACTION去处理这个资料夹。 
       预设ACTION是read(读取)，也就是说此资料夹会被视为一般的档案； 
       若ACTION是skip(略过)，资料夹会被grep略过： 
       若ACTION是recurse(递)，grep会去读取资料夹下所有的档案， 
       此相当於-r 参数。 

    9.  -E, --extended-regexp 
       采用规则表示式去解释样式。 
       
   10.  -e PATTERN, --regexp=PATTERN 
       把样式做为一个partern，通常用在避免partern用-开始。   

   11.  -f FILE, --file=FILE 
       事先将要搜寻的样式写入到一个档案，一行一个样式。 
       然後采用档案搜寻。 
       空的档案表示没有要搜寻的样式，因此也就不会有任何符合。 
        
   ex: (newfile为搜寻样式档) 
       $grep -f newfile file     

   12.  -G, --basic-regexp 
       将样式视为基本的规则表示式解释。(此为预设) 

   13.  -H, --with-filename 
       在每个符合样式行前加上符合的档案名称，若有路径会显示路径。 
        
   ex: (在file与testfile中搜寻panda样式)    
       $grep -H panda file ./testfile 
                file:panda 
                ./testfile:panda 
                $ 
      
   14.  -h, --no-filename   
               与-H参数相类似，但在输出时不显示路径。 

   15.  --help  
               产生简短的help讯息。 

   16.  -I 
               grep会强制认为此二进位档案没有包含任何搜寻样式， 
               与--binary-files=without-match参数相同。 
                    
           ex:  $ grep -I  panda mv 

   17.  -i, --ignore-case        
               忽略大小写，包含要搜寻的样式及被搜寻的档案。 
                
           ex:  $ grep -i panda mv 
                 
   18.  -L, --files-without-match  
               不显示平常一般的输出结果，反而显示出没有符合的档案名称。 

   19.  -l, --files-with-matches                
               不显示平常一般的输出结果，只显示符合的档案名称。 

   20.  --mmap                
               如果可能，使用mmap系统呼叫去读取输入，而不是预设的read系统呼叫。  
               在某些状况，--mmap 能产生较好的效能。 然而，--mmap  
               如果运作中档案缩短，或I/O 错误发生时， 
               可能造成未定义的行为(包含core dump)，。 
                
   21.  -n, --line-number 
               在显示行前，标上行号。 
                
            ex:  $ grep -n  panda file   
                显示结果相似於下: 
                行号:符合行的内容 

   22.  -q, --quiet, --silent  
               不显示任何的一般输出。请参阅-s或--no-messages 

   23.  -r, --recursive 
       递地，读取每个资料夹下的所有档案，此相当於 -d recsuse 参数。 

   24.  -s, --no-messages 
       不显示关於不存在或无法读取的错误讯息。 
      
 小: 不像GNU grep，传统的grep不符合POSIX.2协定， 
       因为缺乏-q参数，且他的-s 参数表现像GNU grep的 -q 参数。 
       Shell Script倾向将传统的grep移植，避开-q及-s参数， 
       且将输出限制到/dev/null。 
     
POSIX: 定义UNIX及UNIX-like系统需要提供的功能。               
     
   25.  -V, --version 
  显示出grep的版本号到标准错误。 
  当您在回报有关grep的bugs时，grep版本号是必须要包含在内的。 

   26.  -v, --invert-match 
  显示除搜寻样式行之外的全部。 
                    
   27.  -w, --word-regexp 
          将搜寻样式视为一个字去搜寻，完全符合该字的行才会被列出。 

   28.  -x, --line-regexp 
  将搜寻样式视为一行去搜寻，完全符合该行的行才会被列出 










grep 命令

用途
在文件中搜索模式。

语法
grep [ -E | -F ] [ -i ] [ -h ] [ -H ] [ -L ] [ -r | -r ] [ -s ] [ -v ] [ -w ] [ -x ] [ -y ] [ [ [ -b ] [ -n ] ] | [ -c | -l | -q ] ] [ -p [ Separator ] ] { [ -e PatternList ... ] [ -f PatternFile ... ] | PatternList ... } [ File ... ]

描述
grep 命令用于搜索由 Pattern 参数指定的模式，并将每个匹配的行写入标准输出中。这些模式是具有限定的正则表达式，它们使用 ed 或 egrep 命令样式。grep 命令使用压缩的不确定算法。

如果在 File 参数中指定了多个名称，grep 命令将显示包含匹配行的文件的名称。对 shell 有特殊含义的字符 （$, *, [, |, ^, (, ), \ ) 出现在 Pattern 参数中时必须带双引号。如果 Pattern 参数不是简单字符串，通常必须用单引号将整个模式括起来。在诸如 [a-z] 之类的表达式中，-（减号）cml 可根据当前正在整理的序列来指定一个范围。整理顺序可以定义等价的类以供在字符范围中使用。如果未指定任何文件，grep 会假定为标准输入。


注： 
请勿对特殊文件运行 grep 命令，这样做可能产生不可预计的结果。 
输入行不应包含空字符。 
输入文件应该以换行符结束。 
换行符不会与正则表达式匹配。 
虽然一些标志可以同时被指定，但其中的某些标志会覆盖其他标志。例如，-l 选项将优先于所有其他标志。另外，如果您同时指定了 -E 和 -F 标志，则后指定的那个会有优先权。
标志

-b 在每行之前添加找到该行时所在的块编号。使用这个标志有助于通过上下文来找到磁盘块号码。-b 标志不能用于来自标准输入和管道的输入。 
-c 仅显示匹配行的计数。 
-E 将每个指定模式视作扩展的正则表达式（ERE）。ERE 的空值将匹配所有的行。 

注：带有 -E 标志的 grep 命令等价于 egrep 命令，只不过它们的错误和使用信息不同以及 -s 标志的作用不同。 
-e PatternList 指定一个或多个搜索模式。其作用相当于一个简单模式，但在模式以 -（减号）开始的情况下，这将非常有用。模式之间应该用换行符分隔。连续使用两个换行符或者在引号后加上换行符 （"\n） 可以指定空模式。除非同时指定了 -E 或 -F 标志，否则每个模式都将被视作基本正则表达式（BRE）。grep 可接受多个 -e 和 -f 标志。在匹配行时，所有指定的模式都将被使用，但评估的顺序没有指定。 
-F 将每个指定的模式视作字符串而不是正则表达式。空字符串可匹配所有的行。 

注： 带有 -F 标志的 grep 命令等价于 fgrep 命令，只不过它们的错误和使用信息不同以及 -s 标志具有不同的作用。 
-f PatternFile 指定包含搜索模式的文件。模式之间应该用换行符加以分隔，空行将被认为是空模式。每种模式都将被视作基本的正则表达式（BRE），除非同时指定了 -E 或 -F 标志。 
-h 禁止在匹配行后附加包含此行的文件的名称。当指定多个文件时，将禁止文件名。 
-H 如果指定了 -r 或 -R 选项并且在命令行上指定了引用文件类型目录的符号链接，则 grep 将搜索符号链接所引用的目录文件以及文件层次结构中在它以下的所有文件。 
-i 在进行比较时忽略字母的大小写。 


-l 仅列出（一次）包含匹配行的文件的名称。文件名之间用换行符加以分隔。如果搜索到标准输入，将返回（标准输入）的路径名。-l 标志同 -c 和 -n 标志的任意组合一起使用时，其作用类似于仅使用了 -l 标志。 
-L 如果指定了 -r 或 -R 选项，并且引用文件类型目录的符号链接在命令行上指定或在文件层次结构转移过程中遇到，则 grep 将搜索符号链接所引用的目录文件以及文件层次结构中在它以下的所有文件。如果同时指定了 -H 和 -L，则命令行上最近指定的选项将生效。 
-n 在每一行之前放置文件中相关的行号。每个文件的起始行号为 1，在处理每个文件时，行计数器都将被复位。 
-p[ Separator] 显示包含匹配行的整个段落。段落之间将按照 Separator 参数指定的段落分隔符加以分隔，这些分隔符是与搜索模式有着相同格式的模式。包含段落分隔符的行将仅用作分隔符，它们不会被包含在输出中。缺省的段落分隔符是空白行。 
-q 禁止所有写入到标准输出的操作，不管是否为匹配行。如果选择了输入行，则以零状态退出。-q 标志同 -c 和 -l、-n 标志的任意组合一起使用时，其作用类似于仅使用了 -q 标志。 
-r 递归地搜索目录。在缺省情况下，按照到目录的链接。 
-r 递归地搜索目录。在缺省情况下，不按照到目录的链接。 
-s 禁止通常因为文件不存在或不可读取而写入的错误信息。其他的错误信息并未被禁止。 
-v  显示所有与指定模式不匹配的行。 
-w 执行单词搜索。 
-x 显示与指定模式精确匹配而不含其他字符的行。 
-y 当进行比较时忽略字符的大小写。 
PatternList 指定将在搜索中使用的一个或多个模式。这些模式将被视作如同是使用 -e 标志指定的。 
File 指定将对其进行模式搜索的文件的名称。如果未给出 File 变量，将使用标准输入。 

退出状态
此命令返回以下出口值:

0 找到匹配项。 
1 未找到匹配项。 
>1 发现语法错误，或者文件不可访问（即使找到了匹配项）。 

示例
若使用包含以下模式匹配字符的模式：*, ^, ?, [, ], \(, \), \{ 和 \}，请输入： 

grep  "^[a-zA-Z]"  pgm.s 
这将显示 pgm.s 中第一个字符为字母的所有行。

若显示所有与模式不匹配的行，请输入： 
grep   -v  "^#" pgm.s

这将显示 pgm.s 中首字母不是 #（井字符）的所有行。 
若显示文件 file1 中与abc 或 xyz 字符串匹配的所有行，请输入： 
grep -E  "abc|xyz"  file1

若在名为 test2 的文件中搜索 $（美元符号），请输入： 

grep \\$ test2
为了强制 shell 将 \$（单反斜杠和美元符号）传递给 grep 命令，必须要使用 \\（双反斜杠）。\（单反斜杠）字符可通知 grep 命令将其后的字符（本例中为 $）视作原义字符而不是表达式字符。如果使用 fgrep 命令，则可以不必使用反斜杠之类的转义字符。

通过 /tmp 递归地搜索以找到含有字 IBM 的文件，而不是通过指向目录的链接进行递归搜索，请输入： 
grep –R IBM /tmp
或 
grep –r -H IBM /tmp
要通过 /tmp 递归地搜索以找到含有词 IBM 的文件，同时也通过链接进行递归搜索，请输入： 
grep –r IBM /tmp
或 
grep -R -L IBM /tmp












◎语法: grep [options]  
 PATTERN [FILE...]  
 grep用以在file内文中比对相对应的部分，或是当没有指定档案时，  
 由标准输入中去比对。 在预设的情况下，grep会将符合样式的那一行列出。 

         此外，还有两个程式是grep的变化型，egrep及fgrep。           
         其中egrep就等同於grep -E ，fgrep等同於grep -F 。 

 ◎参数 
    1. -A NUM，--after-context=NUM  
               除了列出符合行之外，并且列出後NUM行。 
              
         ex:   $ grep -A 1 panda file  
               (从file中搜寻有panda样式的行，并显示该行的後1行) 
                                  
    2. -a或--text   
               grep原本是搜寻文字档，若拿二进位的档案作为搜寻的目标， 
               则会显示如下的讯息: Binary file 二进位档名 matches 然後结束。 
                   
               若加上-a参数则可将二进位档案视为文字档案搜寻， 
               相当於--binary-files=text这个参数。 
             
         ex:   (从二进位档案mv中去搜寻panda样式) 
               (错误!!!) 
               $ grep panda mv  
               Binary file mv matches   
               (这表示此档案有match之处，详见--binary-files=TYPE ) 
               $ 
               (正确!!!) 
               $ grep -a panda mv  
        
    3. -B NUM，--before-context=NUM 
               与 -A NUM 相对，但这此参数是显示除符合行之外 
               并显示在它之前的NUM行。         
              
         ex:   (从file中搜寻有panda样式的行，并显示该行的前1行) 
               $ grep -B 1 panda file  

    4. -C [NUM], -NUM, --context[=NUM]   
               列出符合行之外并列出上下各NUM行，预设值是2。 
              
         ex:   (列出file中除包含panda样式的行外并列出其上下2行) 
               (若要改变预设值，直接改变NUM即可) 
               $ grep -C[NUM]  panda file  
              
    5. -b, --byte-offset 
               列出样式之前的内文总共有多少byte .. 
               
          ex:  $ grep -b  panda file   
       显示结果类似於: 
         0:panda 
        66:pandahuang 
       123:panda03 
            
    6. --binary-files=TYPE 
               此参数TYPE预设为binary(二进位)，若以普通方式搜寻，只有2种结果: 
                 1.若有符合的地方：显示Binary file 二进位档名 matches 
                 2.若没有符合的地方：什麽都没有显示。 
                    
               若TYPE为without-match，遇到此参数， 
               grep会认为此二进位档案没有包含任何搜寻样式，与-I 参数相同。 
                    
               若TPYE为text, grep会将此二进位档视为text档案，与-a 参数相同。 
         
     Warning: --binary-files=text 若输出为终端机，可能会产生一些不必要的输出。 
               
    7. -c, --count 
       不显示符合样式行，只显示符合的总行数。 
       若再加上-v,--invert-match，参数显示不符合的总行数。 

    8. -d ACTION, --directories=ACTION 
               若输入的档案是一个资料夹，使用ACTION去处理这个资料夹。 
       预设ACTION是read(读取)，也就是说此资料夹会被视为一般的档案； 
       若ACTION是skip(略过)，资料夹会被grep略过： 
       若ACTION是recurse(递)，grep会去读取资料夹下所有的档案， 
       此相当於-r 参数。 

    9.  -E, --extended-regexp 
       采用规则表示式去解释样式。 
       
   10.  -e PATTERN, --regexp=PATTERN 
       把样式做为一个partern，通常用在避免partern用-开始。   

   11.  -f FILE, --file=FILE 
       事先将要搜寻的样式写入到一个档案，一行一个样式。 
       然後采用档案搜寻。 
       空的档案表示没有要搜寻的样式，因此也就不会有任何符合。 
        
   ex: (newfile为搜寻样式档) 
       $grep -f newfile file     

   12.  -G, --basic-regexp 
       将样式视为基本的规则表示式解释。(此为预设) 

   13.  -H, --with-filename 
       在每个符合样式行前加上符合的档案名称，若有路径会显示路径。 
        
   ex: (在file与testfile中搜寻panda样式)    
       $grep -H panda file ./testfile 
                file:panda 
                ./testfile:panda 
                $ 
      
   14.  -h, --no-filename   
               与-H参数相类似，但在输出时不显示路径。 

   15.  --help  
               产生简短的help讯息。 

   16.  -I 
               grep会强制认为此二进位档案没有包含任何搜寻样式， 
               与--binary-files=without-match参数相同。 
                    
           ex:

$ grep -I  panda mv 

   17.  -i, --ignore-case        
               忽略大小写，包含要搜寻的样式及被搜寻的档案。 
                
           ex:  $ grep -i panda mv 
                 
   18.  -L, --files-without-match  
               不显示平常一般的输出结果，反而显示出没有符合的档案名称。 

   19.  -l, --files-with-matches                
               不显示平常一般的输出结果，只显示符合的档案名称。 

   20.  --mmap                
               如果可能，使用mmap系统呼叫去读取输入，而不是预设的read系统呼叫。  
               在某些状况，--mmap 能产生较好的效能。 然而，--mmap  
               如果运作中档案缩短，或I/O 错误发生时， 
               可能造成未定义的行为(包含core dump)，。 
                
   21.  -n, --line-number 
               在显示行前，标上行号。 
                
            ex:  $ grep -n  panda file   
                显示结果相似於下: 
                行号:符合行的内容 

   22.  -q, --quiet, --silent  
               不显示任何的一般输出。请参阅-s或--no-messages 

   23.  -r, --recursive 
       递地，读取每个资料夹下的所有档案，此相当於 -d recsuse 参数。 

   24.  -s, --no-messages 
       不显示关於不存在或无法读取的错误讯息。 
      
 小: 不像GNU grep，传统的grep不符合POSIX.2协定， 
       因为缺乏-q参数，且他的-s 参数表现像GNU grep的 -q 参数。 
       Shell Script倾向将传统的grep移植，避开-q及-s参数， 
       且将输出限制到/dev/null。 
     
POSIX: 定义UNIX及UNIX-like系统需要提供的功能。               
     
   25.  -V, --version 
  显示出grep的版本号到标准错误。 
  当您在回报有关grep的bugs时，grep版本号是必须要包含在内的。 

   26.  -v, --invert-match 
  显示除搜寻样式行之外的全部。 
                    
   27.  -w, --word-regexp 
          将搜寻样式视为一个字去搜寻，完全符合该"字"的行才会被列出。 

   28.  -x, --line-regexp 
  将搜寻样式视为一行去搜寻，完全符合该"行"的行才会被列出。 









传统的 grep 程序, 在没有参数的情况下, 只输出符合 RE 字符串之句子. 常见参数如下: 
-v: 逆反模示, 只输出"不含" RE 字符串之句子. 
-r: 递归模式, 可同时处理所有层级子目录里的文件. 
-q: 静默模式, 不输出任何结果(stderr 除外. 常用以获取 return value, 符合为 true, 否则为 false .) 
-i: 忽略大小写. 
-w: 整词比对, 类似 \<word\>; . 
-n: 同时输出行号. 
-c: 只输出符合比对的行数. 
-l: 只输出符合比对的文件名称. 
-o: 只输出符合 RE 的字符串. (gnu 新版独有, 不见得所有版本都支持.) 
-E: 切换为 egrep . 

* egrep: 
为 grep 的扩充版本, 改良了许多传统 grep 不能或不便的操作. 比方说: 
- grep 之下不支持 ? 与 + 这两种 modifier, 但 egrep 则可. 
- grep 不支持 a|b 或 (abc|xyz) 这类"或一"比对, 但 egrep 则可. 
- grep 在处理 {n,m} 时, 需用 \{ 与 \} 处理, 但 egrep 则不需. 
诸如此类的... 我个人会建议能用 egrep 就不用 grep 啦... ^_^ 

* fgrep: 
不作 RE 处理, 表达式仅作一般字符串处理, 所有 meta 均失去功能. 











LINUX /UNIX 下的grep 是比较好的工具 。 据说在LINUX下 ，使用grep ,find 就可以做大部分的事情了， 本人的一些经验 ，希望能给你带来帮助 

  grep [options] PATTERN [FILE...]
  grep [options] [-e PATTERN | -f FILE] [FILE...]

1、参数： 
-I ：忽略大小写 
-c ：打印匹配的行数 
-l ：从多个文件中查找包含匹配项 
-v ：查找不包含匹配项的行 
-n：打印包含匹配项的行和行标 

2、RE（正则表达式） 
\ 忽略正则表达式中特殊字符的原有含义 
^ 匹配正则表达式的开始行 
$ 匹配正则表达式的结束行 
\< 从匹配正则表达式的行开始 
\> 到匹配正则表达式的行结束 
[ ] 单个字符；如[A] 即A符合要求 
[ - ] 范围 ；如[A-Z]即A，B，C一直到Z都符合要求 
. 所有的单个字符 
* 所有字符，长度可以为0 



1. grep -n   "string"   *.c 

可以在 *.c 中找出 string 的字符 ， 并列出行数 ，

grep -n   "strin"*   *.c 

却可以在 *.c 中找到以 strin开头的字符 ， 这个是很舒服的事情


2. ps -A | grep -n "mysql" 


可以在 ps -A 输出的字符中 ，找出 "mysql" 的进程数 


3. more size.txt | grep 'str'* 

在more size.txt 输出的字符中 ，寻找 str 字符

4. 当你要知道当前目录文件的时候用ls 得出所有的文件 ，如果想过滤的话可以用grep .
比如

ls | grep net

列出所有net 开头的文件







