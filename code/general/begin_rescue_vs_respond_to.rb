# frozen_string_literal: true

require 'benchmark/ips'

def slow
  writing
rescue StandardError
  'fast ruby'
end

def fast
  if respond_to?(:writing)
    writing
  else
    'fast ruby'
  end
end

Benchmark.ips do |x|
  x.report('begin...rescue') { slow }
  x.report('respond_to?')    { fast }
  x.compare!
end
