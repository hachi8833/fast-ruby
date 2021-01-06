# frozen_string_literal: true

require 'benchmark/ips'

SLUG = 'test_some_kind_of_long_file_name.rb'

def slower
  SLUG =~ /^test_/
end

def slow
  SLUG.match?(/^test_/)
end

def fast_start
  SLUG.start_with?('test_')
end

def fast_end
  SLUG.end_with?('rb')
end

def fast_include
  SLUG.include?('_long_')
end

Benchmark.ips do |x|
  x.report('String#=~')          { slower }
  x.report('String#match?')      { slow } if RUBY_VERSION >= '2.4.0'
  x.report('String#start_with?') { fast_start }
  x.report('String#end_with?')   { fast_end }
  x.report('String#include?')    { fast_include }
  x.compare!
end
