# frozen_string_literal: true

require 'benchmark/ips'

ARRAY = [*1..100].freeze

def fast
  ARRAY[0]
end

def slow
  ARRAY.first
end

Benchmark.ips do |x|
  x.report('Array#[0]') { fast }
  x.report('Array#first') { slow }
  x.compare!
end
