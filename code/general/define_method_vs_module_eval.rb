# frozen_string_literal: false

require 'benchmark/ips'

def method_names(number)
  number.times.map do
    10.times.inject('') { |e| e << ('a'..'z').to_a.sample }
  end
end

# for define_method
class DefineMethod
  def self.def_methods(some_methods)
    some_methods.each do |method_name|
      define_method method_name do
        puts 'win'
      end
    end
  end
end

# for module_eval
class ModuleEvalWithString
  def self.def_methods(some_methods)
    some_methods.each do |method_name|
      module_eval <<~RUBY, __FILE__, __LINE__ + 1
        def #{method_name}
          puts 'win'
        end
      RUBY
    end
  end
end

def fast
  DefineMethod.def_methods(method_names(10))
end

def slow
  ModuleEvalWithString.def_methods(method_names(10))
end

Benchmark.ips do |x|
  x.report('module_eval with string') { slow }
  x.report('define_method')           { fast }
  x.compare!
end
