require 'spec_helper'
describe 'apmd' do

  context 'with defaults for all parameters' do
    it { should contain_class('apmd') }
  end
end
