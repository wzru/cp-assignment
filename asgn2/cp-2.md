# 编译原理第2次作业

**1** **设文法的规则如下：A→A1|A0|Aa|Ac|a|b|c** **，该文法的句子是（A）。**

   **A.bc10    B.bbbb  C.bcbc     D.1001**

**2** **若一个不含多余规则的文法是递归的，则该文法生成语言的句子个数（B）。**

**A.** **是有穷的**   **B.** **是无穷的** 

**C.** **对具体文法才可以确定**  

**D.** **无法确定**

**3、写出文法G[N]:N->D|ND**

**D->0|1|2|3|4|5|6|7|8|9**

**1）G[N]定义的语言是什么？**

**2）句子2019的最左推导、最右推导（规范推导）**
$$
3. Solve:\\
(1)L=\{\prod_{i=0}^{9}{i^{\alpha_i}}|\alpha_i\ge 0,max\{\alpha_i\}\ge1\} \\
(2)最左推导：N\Rightarrow ND\Rightarrow NDD\Rightarrow NDDD\Rightarrow DDDD\Rightarrow 2DDD\Rightarrow 20DD\Rightarrow 201D\Rightarrow 2019 \\
最右推导（规范推导）：N\Rightarrow ND\Rightarrow N9\Rightarrow ND9\Rightarrow N19\Rightarrow ND19\Rightarrow N019\Rightarrow D019\Rightarrow 2019
$$


**4、设计文法描述语言：**

1）$L_1=\{a^nb^nc^i|n\ge1,i\ge0\}$

2）$L_6=\{1^n0^m1^m0^n |n,m\ge0\}$
$$
4.Solve：\\
(1)G[L_1]=(\{S\},\{a,b,c\},\{S\rightarrow ab|aSb|Ac\},S) \\
(2)G[L_6]=(\{S\},\{0,1\},\{S\rightarrow A | 1A0,A\rightarrow \epsilon | 0A1\},S) \\
$$


9、文法$G[T]$:

$T\rightarrow T*F|F$

$F\rightarrow F↑P|P$

$P\rightarrow (T)|i$

写出句型$T*P↑(T*F)$的语法树，所有短语、直接短语、句柄；

$$
9.Solve:\\
最右推导：T\Rightarrow T*F\Rightarrow T*F↑P\Rightarrow T*F↑(T)\Rightarrow T*F↑(T*F)\Rightarrow T*P↑(T*F) \\
$$
语法树：

![image-20201018155104157](http://shaw.wang:9888/images/2020/10/18/image-20201018155104157.png)

$$
T*F为句型的相对于T的短语，且为直接短语\\
(T*F)为句型的相对于P的短语\\
P↑(T*F)为句型的相对于F的短语\\
T*P↑(T*F)为句型的相对于T的短语\\
P为句型的相对于F的短语，且为直接短语\\
2个直接短语中，P为句柄
$$


8、证明文法G[<表达式>]

<表达式>-> i|<表达式><运算符><表达式>

<运算符>->+|-|*|/

是二义性文法
$$
8.Proof：\\
对于句子i*i+i有两个不同的最左推导，分别对应两颗不同的语法树\\
推导1：<表达式>\Rightarrow <表达式>+<表达式>\Rightarrow <表达式>*<表达式>+<表达式>\\
\Rightarrow i*<表达式>+<表达式>\Rightarrow i*i+<表达式>\Rightarrow i*i+i\\
推导2：<表达式>\Rightarrow <表达式>*<表达式>\Rightarrow i*<表达式>\\
\Rightarrow i*<表达式>+<表达式>\Rightarrow i*i+<表达式>\Rightarrow i*i+i\\
所以这个文法具有二义性。Q.E.D
$$