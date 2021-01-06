# frozen_string_literal: true

require 'benchmark/ips'

H1 = { a: 1 }.freeze
H2 = { a: 2 }.freeze
H3 = { a: 3 }.freeze

def key_fast
  h = { a: 1 }
  h[:a] = 2
  h[:a] = 3
end

def key_slow
  H1.merge(H2.merge(H3))
end

Benchmark.ips do |x|
  x.report('Hash#[]=')     { key_fast }
  x.report('Hash#merge')   { key_slow }
  x.compare!
end
