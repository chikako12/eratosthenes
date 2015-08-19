require File.expand_path(File.dirname(__FILE__) + '/../lib/eratos.rb')

describe Eratos do
  # 2から100までの引数で実行した場合、期待される答えが得られる事を確認する 
  # [参考]素数表: http://members.just-size.net/prime/prime1.html
  ary_sosuu = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
  (2..100).each do |x|
    specify { expect(`ruby ./lib/eratos.rb #{x}`).to eq ary_sosuu.select{|n| n <= x}.join(', ')}
  end
  # 入力エラー
  specify { expect(`ruby ./lib/eratos.rb`).to eq ''}
  specify { expect(`ruby ./lib/eratos.rb 10 20`).to eq ''}
  specify { expect(`ruby ./lib/eratos.rb -1`).to eq ''}
  specify { expect(`ruby ./lib/eratos.rb 0`).to eq ''}
  specify { expect(`ruby ./lib/eratos.rb 1`).to eq ''}
  specify { expect(`ruby ./lib/eratos.rb str`).to eq ''}
end
