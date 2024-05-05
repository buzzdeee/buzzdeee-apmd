require 'spec_helper'

describe 'apmd' do
  let :os_facts do
    {
      osfamily: 'OpenBSD',
      os: { family: 'OpenBSD' },
      apm_arch: true,
    }
  end

  context 'on APM platform' do
    let :facts do
      os_facts.merge(
        {
          apm_arch: true,
        },
      )
    end

    context 'with default parameters' do
      it { is_expected.to compile.with_all_deps }  # same as above except it will test all the dependencies
      it { is_expected.to contain_class('apmd::service') }
      it {
        is_expected.to contain_service('apmd').with(
          'ensure' => 'running',
          'enable' => 'true',
          'flags'  => '-A',
        )
      }
    end
    context 'with custom parameters' do
      let :params do
        {
          service_ensure: 'stopped',
          service_enable: false,
          service_flags: '-H',
          service_name: 'yuck',
        }
      end

      it { is_expected.to compile.with_all_deps }  # same as above except it will test all the dependencies
      it { is_expected.to contain_class('apmd::service') }
      it {
        is_expected.to contain_service('yuck').with(
          'ensure' => 'stopped',
          'enable' => 'false',
          'flags'  => '-H',
        )
      }
    end
  end

  context 'with default parameters on non APM platform' do
    let :facts do
      os_facts.merge(
        {
          apm_arch: false,
        },
      )
    end

    it { is_expected.to compile.with_all_deps }  # same as above except it will test all the dependencies
    it { is_expected.not_to contain_class('apmd::service') }
    it { is_expected.not_to contain_service('apmd') }
  end
end
