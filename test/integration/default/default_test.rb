# InSpec test for recipe python_cookbook_AMI::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

# unless os.windows?
#   # This is an example test, replace with your own test.
#   describe user('root'), :skip do
#     it { should exist }
#   end
# end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should be_listening }
end

describe package 'python3-pip' do
  it { should be_installed}
end

describe package 'python3.7' do
   it { should be_installed}
   its ('version') {should cmp > '3.7*'}
 end

describe directory "/var/lib/jenkins" do
  it {should exist}
end
