# CS143 Compilers 
Programming Assignments of CS143 Compilers (Java edition)

## Todo

- PA1: done
- PA2J: done
- PA3J
- PA4J
- PA5J

## 环境配置
Platform: Ubuntu 22.04

Install packages. For Ubuntu:
```shell
$ sudo apt-get install flex bison build-essential csh openjdk-6-jdk libxaw7-dev
```

Make the /usr/class directory and go to /usr/class and download the tar file:
```shell
$ sudo mkdir /usr/class
$ cd /usr/class
$ wget https://courses.edx.org/asset-v1:StanfordOnline+SOE.YCSCS1+1T2020+type@asset+block@student-dist.tar.gz
$ tar -xf student-dist.tar.gz
```

Add the bin directory to your $PATH environment variable. If you are using bash, add to your .profile (or .bash_profile, etc. depending on your configuration; note that in Ubuntu have to log out and back in for this to take effect):
```shell
$ PATH=/usr/class/cs143/cool/bin:$PATH
```

install Jflex
```shell
$ sudo apt install jflex
```
install JavaCup
```shell
$  wget https://www.cs.cornell.edu/courses/cs4120/2022sp/lib/java_cup.jar
```
install libc6-i386 (for 64-bit OS)
```shell
$ sudo apt-get install libc6-i386
```


## PA1
 Here are a few examples of simple COOL programs:

 [Hello world](./examples/hello_world.cl)
 ``` cool
 class Main inherits IO {
   main(): SELF_TYPE {
	out_string("Hello, World.\n")
   };
};
 ```
 
 [Palindrome checking program](./examples/palindrome.cl)
 ``` cool
 class Main inherits IO {
    pal(s : String) : Bool {
	    if s.length() = 0 
          then true
	    else if s.length() = 1 
          then true
	    else if s.substr(0, 1) = s.substr(s.length() - 1, 1) 
          then pal(s.substr(1, s.length() -2))
	    else false
	    fi fi fi
    };

    i : Int;

    main() : Object {
      {
          i <- ~1;
          out_string("enter a string\n");
          if pal(in_string())
              then out_string("that was a palindrome\n")
              else out_string("that was not a palindrome\n")
          fi;
      }
    };
};

 ```


## PA2J

### 资料
 - [PA2J handout](https://web.stanford.edu/class/cs143/handouts/PA1%20Handout.pdf)

### Write-up for PA2J

 - Download the grading script：
```shell
$ wget https://courses.edx.org/assets/courseware/v1/2aa4dec0c84ec3a8d91e0c1d8814452b/asset-v1:StanfordOnline+SOE.YCSCS1+1T2020+type@asset+block/pa1-grading.pl
```
 - Required Dependencies：java_cup
 - Useful Run Commands
```shell
$ make clean
$ rm -r grading/
$ make lexer
$ perl pa1-grading.pl
```

### JFlex Notes

#### 整体结构
 - 用户代码段(UserCode)
 - %%
 - 参数设置和声明段(Options and declarations)
 - %%
 - 词法规则段(Lexical rules)
#### 结构分析
**用户代码段**
 - This is the place to put package declarations and import statements. 如import java_cup.runtime.Symbol;

**参数设置和声明段**
 - 参数设置：
   - `%class Lexer`：第一个参数，class Lexer，告诉 JFlex 把生成的类命名为Lexer并把代码写到名为Lexer.java的文件
   - `%line`：参数 Line打开行计数，使你可以用变量yyline存取输入的当前行号
   - `%column`：参数column有类似的作用，除了它是通过变量yycolumn存取当前列号
   - `%cup`：参数cup，把JFlex设置成一个特殊模式，使它与CUP产生的处理器兼容
 - 声明段：
   - `%{ ... }%`：The code enclosed in %{ and %} is copied verbatim into the generated class. Here you can define your own member variables and functions in the generated scanner
   - `%init{...%init}`：（构造函数）The code enclosed in %init{ and %init} is copied verbatim into the constructor of the generated class. Here, member variables declared in the %{...%} directive can be initialised.

**词法规则段**

#### 常用API
 - `String yytext()`：returns the matched input text region
 - `int yystate()`：returns the current lexical state of the scanner
 - `void yybegin(int lexicalState)`：enters the lexical state lexicalState
 - `int yycolumn`：contains the current column of the current line (starting with 0, only active with the columnCounting directive)
 - `int yyline`：contains the current line of input (starting with 0, only active with the lineCounting directive)

### PA2J References
 - Theory of Compilation: JLex, CUP tools: http://cs.haifa.ac.il/courses/compilers/BILAL/Tutorials/JLex_CUP_tools.pdf
 - JLex user manual: https://www.cs.princeton.edu/~appel/modern/java/JLex/current/manual.html#SECTION1
 - java_cup.runtime.Symbol API: https://web.stanford.edu/class/archive/cs/cs143/cs143.1112/javadoc/java_cup/
 - JFlex User’s Manual: https://jflex.de/manual.html
 - Flex tutorial: https://medium.com/@ilyarudyak/flex-tutorial-9ed34fd1ff28
 - Lexical Analysis and Regular Expressions: https://www.cs.cornell.edu/courses/cs4120/2022sp/notes.html?id=lexing
 - 语法分析生成器 JFlex 使用教程：https://www.open-open.com/lib/view/open1325299800733.html
 - 使用 JFlex 生成词法分析器的安装配置及简单示例：https://www.cnblogs.com/truelycloud/p/10387812.html

## PA3J

### 资料
 - [PA3J handout](https://web.stanford.edu/class/cs143/handouts/PA3%20Handout.pdf)