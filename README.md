### CS143 Compilers

### Todo

- PA1: done
- PA2J: done
- PA3J
- PA4J
- PA5J

### 笔记

#### PA1


#### PA2J

1. Jflex
   1. 整体结构
   用户代码段(UserCode)
   %%
   参数设置和声明段(Options and declarations)
   %%
   词法规则段(Lexical rules)

   2. 结构分析
      1. 用户代码段
         1. This is the place to put package declarations and import statements
            1. 引入类：import java_cup.runtime.Symbol;
      2. . 参数设置和声明段
         1. 参数设置：
            1. %class Lexer。第一个参数，class Lexer，告诉 JFlex 把生成的类命名为Lexer并把代码写到名为Lexer.java的文件
            2. %line：参数 Line打开行计数，使你可以用变量yyline存取输入的当前行号
            3. %column：参数column有类似的作用，除了它是通过变量yycolumn存取当前列号
            4. %cup：参数cup，把JFlex设置成一个特殊模式，使它与CUP产生的处理器兼容
         2. 声明段：
            1. %{ ... }%：The code enclosed in %{ and %} is copied verbatim into the generated class. Here you can define your own member variables and functions in the generated scanner
            2. %init{...%init}：（构造函数）The code enclosed in %init{ and %init} is copied verbatim into the constructor of the generated class. Here, member variables declared in the %{...%} directive can be initialised.
      3. 词法规则段
   
   3. 常用API
      1. String yytext()：returns the matched input text region
      2. int yystate()：returns the current lexical state of the scanner
      3. void yybegin(int lexicalState)：enters the lexical state lexicalState
      4. int yycolumn：contains the current column of the current line (starting with 0, only active with the columnCounting directive)
      5. int yyline：contains the current line of input (starting with 0, only active with the lineCounting directive)

### References
1. 语法分析生成器 JFlex 使用教程：https://www.open-open.com/lib/view/open1325299800733.html
2. JFlex User’s Manual: https://jflex.de/manual.html
3. 使用 JFlex 生成词法分析器的安装配置及简单示例：https://www.cnblogs.com/truelycloud/p/10387812.html
4. Flex tutorial: https://medium.com/@ilyarudyak/flex-tutorial-9ed34fd1ff28
5. Lexical Analysis and Regular Expressions: https://www.cs.cornell.edu/courses/cs4120/2022sp/notes.html?id=lexing