# frozen_string_literal: true

require 'benchmark/ips'

RANGE = (1..100)

def slow
  n = 0
  n.zero?
end

def fast
  n = 0
  n == 0
end

Benchmark.ips do |x|
  x.report('zero?') { slow }
  x.report('== 0')  { fast }
  x.compare!
end
