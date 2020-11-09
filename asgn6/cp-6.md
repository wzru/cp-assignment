# 编译原理第6次作业

## 4.2

对下面的文法G：
$$
E\rightarrow TE' \\
E'\rightarrow +TE'|\epsilon \\
T\rightarrow FT' \\
T'\rightarrow *FT'|\epsilon \\
F\rightarrow (E)|id
$$
（1）计算这个文法的每个非终结符的FIRST集和FOLLOW集。

（2）证明这个文法是$LL(1)$。

（3）构造它的预测分析表。

（4）构造它的递归下降分析程序。
$$
Solve:(1)
$$

|      | FIRST           | FOLLOW       |
| ---- | --------------- | ------------ |
| E    | {(, id}         | {), $}       |
| E'   | {+, $\epsilon$} | {), $}       |
| T    | {(, id}         | {+, ), $}    |
| T'   | {*, $\epsilon$} | {+, ), $}    |
| F    | {(, id}         | {*, +, ), $} |

(2)对于非终结符E', T', F都有
$$
SELECT(E'\rightarrow +TE')\cap SELECT(E'\rightarrow\epsilon)=\varnothing \\
SELECT(T'\rightarrow *FT')\cap SELECT(T'\rightarrow\epsilon)=\varnothing \\
SELECT(F\rightarrow id)\cap SELECT(F\rightarrow(E))=\varnothing
$$
所以该文法是$LL(1)$文法

(3)

|      | id                 | +                       | *                    | (                  | )                       | $                       |
| ---- | ------------------ | ----------------------- | -------------------- | ------------------ | ----------------------- | ----------------------- |
| E    | $E\rightarrow TE'$ |                         |                      | $E\rightarrow TE'$ |                         |                         |
| E'   |                    | $E'\rightarrow +TE'$    |                      |                    | $E'\rightarrow\epsilon$ | $E'\rightarrow\epsilon$ |
| T    | $T\rightarrow FT'$ |                         |                      | $T\rightarrow FT'$ |                         |                         |
| T'   |                    | $T'\rightarrow\epsilon$ | $T'\rightarrow *FT'$ |                    | $T'\rightarrow\epsilon$ | $T'\rightarrow\epsilon$ |
| F    | $F\rightarrow id$  |                         |                      | $F\rightarrow(E)$  |                         |                         |

(4)

```c
main() {
  Scaner();
  E() {
    if (sym)
      printf("success");
    else
      printf("fail");
  }
  E() {
    T();
    E'();
  }
  E'() {
    if (sym == '+') {
      Scaner();
      T();
      E'();
    } else if (sym != ')' && sym != '$')
      error();
  }
  T() {
    F();
    T'();
  }
  T'() {
      if(sym=='*')
      {
          Scaner();
          F();
          T'();
      }
      else if(sym!=follow(T')) error();
  }
  F() {
      if(sym==id) Scaner();
      else if(sym=='(')
      {
          Scaner();
          E();
          if(sym==')') Scaner();
          else error();
      }
      else error();
  }
}
```

## 4.5

设有表格文法$G[S]$
$$
S\rightarrow a|\and|(T) \\
T\rightarrow T,S|S
$$
（2）计算$G[S]$的$FIRSTVT$集和$LASTVT$集；

（3）构造其优先关系表，判断$G[S]$是否为算符优先文法
$$
Solve:(2)
$$

|      | FIRSTVT          | LASTVT           |
| ---- | ---------------- | ---------------- |
| S    | $\{a,\and,(\}$   | $\{a,\and,)\}$   |
| T    | $\{,,a,\and,(\}$ | $\{,,a,\and,)\}$ |

（3）

|        | $a$   | $\and$ | $,$   | $($   | $)$   |
| ------ | ----- | ------ | ----- | ----- | ----- |
| $a$    |       |        | $\gt$ |       | $\gt$ |
| $\and$ |       |        | $\gt$ |       | $\gt$ |
| $,$    | $\lt$ | $\lt$  | $\gt$ | $\lt$ | $\gt$ |
| $($    | $\lt$ | $\lt$  | $\lt$ | $\lt$ |       |
| $)$    |       |        | $\gt$ |       | $\gt$ |

