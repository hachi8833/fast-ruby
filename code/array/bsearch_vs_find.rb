# frozen_string_literal: true

require 'benchmark/ips'

data = [*0..100_000_000]

Benchmark.ips do |x|
  x.report('find')    { data.find    { |number| number > 77_777_777 } }
  x.report('bsearch') { data.bsearch { |number| number > 77_777_777 } }
  x.compare!
end

Benchmark.ips do |x|
  x.report('find')    { data.find { |n| n == 1 } }
  x.report('bsearch') { data.bsearch { |n| 1 <=> n } }
  x.compare!
end

Benchmark.ips do |x|
  x.report('find') { data.find       { |n| n == 50_000_000 } }
  x.report('bsearch') { data.bsearch { |n| 50_000_000 <=> n } }
  x.compare!
end
