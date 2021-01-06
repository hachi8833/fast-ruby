# frozen_string_literal: true

require 'benchmark/ips'

def fast
  (Class <= Module)
  (Class <= Object)
  (Class <= Kernel)
  (Class <= BasicObject)
end

def slow
  Class.ancestors.include?(Module)
  Class.ancestors.include?(Object)
  Class.ancestors.include?(Kernel)
  Class.ancestors.include?(BasicObject)
end

Benchmark.ips do |x|
  x.report('less than or equal') { fast }
  x.report('ancestors.include?') { slow }
  x.compare!
end
