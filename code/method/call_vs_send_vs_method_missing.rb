# frozen_string_literal: true

require 'benchmark/ips'

# for method calls
class MethodCall
  def method; end

  def method_missing(a_method, *args)
    (a_method == :not_exist || args == :nil?) || super
    method
  end

  private

  def respond_to_missing?(a_method, *args)
    (a_method == :not_exist || args == :nil?) || super
  end
end

def fastest
  method = MethodCall.new
  method.method
end

def slow
  method = MethodCall.new
  method.send(:method)
end

def slowest
  method = MethodCall.new
  method.not_exist
end

Benchmark.ips do |x|
  x.report('call')           { fastest }
  x.report('send')           { slow    }
  x.report('method_missing') { slowest }
  x.compare!
end
