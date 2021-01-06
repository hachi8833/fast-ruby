# frozen_string_literal: true

require 'benchmark/ips'

ARRAY = (1..100).to_a

def slow
  ARRAY.reverse.each(&:even?)
end

def fast
  ARRAY.reverse_each(&:even?)
end

Benchmark.ips do |x|
  x.report('Array#reverse.each') { slow }
  x.report('Array#reverse_each') { fast }
  x.compare!
end
