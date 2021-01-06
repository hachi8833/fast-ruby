# frozen_string_literal: true

require 'benchmark/ips'

ARRAY = Array.new(100) { rand(100) }.freeze

def slow
  ARRAY.shuffle.first
end

def fast
  ARRAY.sample
end

Benchmark.ips do |x|
  x.report('Array#shuffle.first') { slow }
  x.report('Array#sample')        { fast }
  x.compare!
end
