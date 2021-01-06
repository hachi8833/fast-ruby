# frozen_string_literal: true

require 'benchmark/ips'

ARRAY = [*1..100].freeze

def slow
  ARRAY.select { |x| x.eql?(15) }.first
end

def fast
  ARRAY.detect { |x| x.eql?(15) }
end

Benchmark.ips(20) do |x|
  x.report('Enumerable#select.first') { slow }
  x.report('Enumerable#detect') { fast }
  x.compare!
end
