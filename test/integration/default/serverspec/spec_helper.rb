require 'serverspec'

set :backend, :exec

RSpec.configure do |c|
  c.output_stream = File.open('serverspec-result.xml', 'w')
  c.formatter = :html
  c.color = true
  c.tty = true
end
