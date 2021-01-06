# frozen_string_literal: true

require 'benchmark/ips'

ARRAY = (1..100).to_a

def slower
  array = []
  ARRAY.each { |i| array.push i }
end

def slow
  array = []
  ARRAY.each { |i| array << i }
end

def fast
  ARRAY.map { |i| i }
end

Benchmark.ips do |x|
  x.report('Array#each + push') { slower }
  x.report('Array#each + <<')   { slow }
  x.report('Array#map')         { fast }
  x.compare!
end
