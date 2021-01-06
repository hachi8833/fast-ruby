# frozen_string_literal: true

require 'benchmark/ips'

SLUG = 'test_some_kind_of_long_file_name.rb'

def slower_multi
  SLUG =~ /^empty|^void|^test_/
end

def slow_multi
  SLUG.match?(/^empty|^void|^test_/)
end

def fast_start_multi
  SLUG.start_with?('empty', 'void', 'test_')
end

def fast_end_multi
  SLUG.end_with?('useless', 'missing', 'rb')
end

Benchmark.ips do |x|
  x.report('String#=~')          { slower_multi }
  x.report('String#match?')      { slow_multi } if RUBY_VERSION >= '2.4.0'
  x.report('String#start_with?') { fast_start_multi }
  x.report('String#end_with?')   { fast_end_multi }
  x.compare!
end
