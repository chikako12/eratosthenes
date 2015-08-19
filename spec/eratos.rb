class Eratos
  def self.calculate(max)
    # 2～指定値までを配列で保持
    ary_all = (2..max).to_a
    # 配列のレングスが1(指定値 == 2)の場合は以下を行わず2のみ返す
    return ary_all if ary_all.length == 1

    # 素数と判定したものを入れる空配列を定義
    ary_sosuu = []

    # 判定した値を削除しながら先頭の値が√選択値になるまで以下を行う
    # ary_allの先頭がmaxの平方根以下である間LOOP
    while ary_all.first <= Math.sqrt(max)
      # -->ary_sosuuにmaxの平方根以下の素数(ary.allの先頭の値)をpush
      # -->判定を行う素数(ary_allの先頭値)は削除しておく
      ary_sosuu << ary_all.shift
      # ary_allの中から素数の倍数(合成数)をふるい落とす
      # --> 処理中の素数(ary_sosuuにpushした値)と割って
      #     余りがゼロでないもののみにary_allを更新する(上書きする)
      #     (√max以下の素数はすでにary_sosuuにpush済みなので消えてok)
      ary_all = ary_all.select {|i| i.modulo(ary_sosuu.last) !=0}
    end

    # ary_sosuuにmaxの平方根を超える素数をpushする　　
    return ary_sosuu += ary_all
  end
end

# ARGV配列入力チェック
def valid_args?(args)
  if ARGV.length == 0
    false
  elsif ARGV.length > 1
    false
  elsif Integer(args[0]) < 2
    false
  else
    true
  end
rescue
  # 引数がない場合
  false
end

if __FILE__ == $0
  if valid_args?(ARGV)
    print Eratos.calculate(Integer(ARGV[0])).join(', ')
  else
    print ''
  end
end
