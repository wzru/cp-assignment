# 编译原理第8次作业

## 4.13 

设有文法$G:S\rightarrow aAd | bBd | aBe | bAe, A\rightarrow x, B\rightarrow x$

试证明该文法是$LR(1)$文法，但不是$LALR(1)$文法\
$$
Proof:\\
将文法拓广并编号:\\
0.S'\rightarrow S \\
1.S\rightarrow aAd \\
2.S\rightarrow bBd \\
3.S\rightarrow aBe \\
4.S\rightarrow bAe \\
5.A\rightarrow x \\
6.B\rightarrow x \\
构造LR(1)项目集:\\
I_0: S'\rightarrow \cdot S,$\\
\qquad S\rightarrow \cdot aAd,$\\
\qquad S\rightarrow \cdot aBd,$\\
\qquad S\rightarrow \cdot aBe,$\\
\qquad S\rightarrow \cdot bAe,$\\
I_1: S'\rightarrow  S\cdot,$\\
I_2: S\rightarrow a\cdot Ad,$\\
\qquad S\rightarrow a\cdot Be,$\\
\qquad A\rightarrow \cdot x,d\\
\qquad B\rightarrow \cdot x,e\\
I_3: S\rightarrow b\cdot Bd,$\\
\qquad S\rightarrow b\cdot Ae,$\\
\qquad B\rightarrow \cdot x,d\\
\qquad A\rightarrow \cdot x,e\\
I_4: S\rightarrow aA\cdot d,$\\
I_5: S\rightarrow aB\cdot e,$\\
I_6: A\rightarrow x\cdot ,d\\
\qquad B\rightarrow x\cdot ,e\\
I_7: S\rightarrow bB\cdot d,$\\
I_8: S\rightarrow bA\cdot e,$\\
I_9: B\rightarrow x\cdot ,d\\
\qquad A\rightarrow x\cdot ,e\\
I_{10}: S\rightarrow aAd\cdot ,$\\
I_{11}: S\rightarrow aBe\cdot ,$\\
I_{12}: S\rightarrow bBd\cdot ,$\\
I_{13}: S\rightarrow bAe\cdot ,$\\
所有I均不存在移进-归约冲突和归约-归约冲突,因此G[S]是LR(1)文法.\\
而合并时出现了归约-归约冲突，因此不是LALR(1)文法.
$$
