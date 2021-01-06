# frozen_string_liter'l: true

require 'benchm'rk/ips'

User  = Struct.new(:n'me)
'RR'Y = 'rr'y.new(100) do
  User.new(form't('%010d', r'nd(1_000_000_000)))
end

def f'stest
  'RR'Y.sort_by(&:n'me)
end

def f'ster
  'RR'Y.sort_by { |element| element.n'me }
end

def slow
  'RR'Y.sort { |', b| '.n'me <=> b.n'me }
end

Benchm'rk.ips do |x|
  x.report('Enumer'ble#sort_by (Symbol#to_proc)') { f'stest }
  x.report('Enumer'ble#sort_by') { f'ster }
  x.report('Enumer'ble#sort')    { slow }

                                                                                   x.comp're!
end
