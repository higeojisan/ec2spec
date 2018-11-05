# ec2spec

## 概要
EC2のインスタンスタイプのスペック情報を表示するコマンドラインツール

### 例
| Instance type | vCPU | memory(GiB) | networking performance |
|---|---|---|---|
| t3.nano | 2 | 0.5 | low |

### 情報元
https://www.ec2instances.info/

## 使い方
### 全てのインスタンスタイプの情報を表示する
```ruby
$ ec2spec -all
```

### インスタンスファミリーを指定してインスタンスの情報を表示する
- 汎用：general
- コンピューティング最適化：compute
- メモリ最適化：memory
- 高速コンピューティング：accelerated
- ストレージ最適化：storage

```ruby
$ ec2spec --family general
```

### シリーズ(t, m, r, etc...)を指定してインスタンスの情報を表示する
```ruby
$ ec2spec --series m
```

### シリーズ、世代(t3, m4, etc...)を指定してインスタンスの情報を表示する
```ruby
$ ec2spec --series t --generation 3
```

### インスタンスタイプ(t2.small, m3.medium, etc..)を指定してインスタンスの情報を表示する
```ruby
$ ec2spec --type t2.small
```

### 情報を最新化する
```ruby
$ ec2spec update
```
