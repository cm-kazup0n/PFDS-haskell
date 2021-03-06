## exercise 3.1

- 右スパインは常に最も右の空ノードへの最短経路になる
- 高さhの２分木の最大のノード数 n = h^2 - 1

n = h^2 - 1
n+1 = h^2
h=log(n+1)

## exercise 3.4

重み左偏ヒープは、左偏ヒープの左偏性を重み左偏性(weight-biased leftist property)に置き換えたものである。重み左偏性とは、任意の左の子 のサイズが、少なくとも右の兄弟ノードと同じサイズを持つという性質である。

```
(a) 重み左偏ヒープの右スパインが、たかだか ⌊log(n + 1)⌋ 個の要素しか持たないことを 証明しよう。
(b) 図 3.2 の実装を修正して、重み左偏ヒープを作ってみよう。
(c) 現在、merge の処理は二段階になっている。merge の呼び出しからなるトップダウンの処理と、補助関数 makeT の呼び出しからなるボトムアップの処理である。重み左偏ヒープの merge を修正して、単一のトップダウン処理で実行できるようにしよう。
(d) トップダウン版の merge は遅延評価の環境ではどのような利点を持つだろうか? 並列実行の環境ではどうか?
```


### 3.4.a

定義より右スパインが最大になるのは木が完全2分木である場合で、
空ノードへの経路上の全ての内部ノードの数は木の高さdと等しい。
木のノード数nは以下の通り

n = 2^d - 1
n + 1 = 2^d
d = log (n+1) 
アンバランスな木では右スパインの長さは高々dなので右スパインの長さはfloor(log(n+1))になる

### 3.8

- 赤黒木の最短経路が最も短くなるのは完全2分木になっているときでその高さは高々 log (n+1)である
- 赤黒木の最短経路はすべてのノードが黒のとき
- 赤黒木の最長経路は赤黒が交互に現れるとき
- 最長経路における黒の数をmとすると赤の数は高々mなので経路は高々2m
- 最短経路の黒の数と最長経路の黒の数は同じなのでmは高々log(n+1) である
- 上記より最長経路の高さは高々 2m = 2 log (n+1)
