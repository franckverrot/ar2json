require 'helper'
require 'benchmark'

Benchmark.bm do |b|
  b.report('User.scoped.to_json                 ') do
    400.times { User.scoped.to_json }
  end

  b.report('User.all.to_json                    ') do
    400.times { User.all.to_json }
  end

  b.report('User.where(:id => [1,2]).to_json    ') do
    400.times { User.where(:id => [1,2]).to_json }
  end

  b.report('User.where(:id => [1,2]).all.to_json') do
    400.times { User.where(:id => [1,2]).all.to_json }
  end

  b.report('User.where(:id => 1).to_json        ') do
    400.times { User.where(:id => 1).to_json }
  end

  b.report('User.where(:id => 1).all.to_json    ') do
    400.times { User.where(:id => 1).all.to_json }
  end
end
