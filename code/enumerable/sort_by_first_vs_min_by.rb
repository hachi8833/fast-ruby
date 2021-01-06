# frozen_string_literal: true

require 'benchmark/ips'

ARRAY = Array.new(1000) { rand(1000) }.freeze

def fast
  ARRAY.min_by(&:succ)
end

def slow
  ARRAY.sort_by(&:succ).first
end

Benchmark.ips do |x|
  x.report('Enumerable#min_by') { fast }
  x.report('Enumerable#sort_by...first') { slow }
  x.compare!
end
