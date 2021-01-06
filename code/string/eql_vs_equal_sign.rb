# frozen_string_literal: true

require 'benchmark/ips'

SLUG = 'test_some_kind_of_long_file_name.rb'
SLUG2 = 'test_some_kind_of_long_file_name.rb'

def slow
  SLUG == SLUG2
end

def fast
  SLUG.eql?(SLUG2)
end

Benchmark.ips do |x|
  x.report('String#==')          { slow }
  x.report('String#eql?')        { fast }
  x.compare!
end
