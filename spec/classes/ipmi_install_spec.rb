require 'spec_helper'

describe 'ipmi::install', :type => :class do
  let :pre_condition do
    'include ipmi::params'
  end

  describe 'for osfamily RedHat' do
    let :facts do 
      {
        :osfamily          => 'RedHat',
      }
    end

    describe 'el5.x' do
      before { facts[:operatingsystemmajrelease] = '5' }
  
#      it { should contain_class('ipmi::install') }
      it { should contain_package('OpenIPMI').with_ensure('present') }
      it { should contain_package('OpenIPMI-tools').with_ensure('present') }
    end

    describe 'el6.x' do
      before { facts[:operatingsystemmajrelease] = '6' }

#      it { should contain_class('ipmi::install') }
      it { should contain_package('OpenIPMI').with_ensure('present') }
      it { should contain_package('ipmitool').with_ensure('present') }
    end

    describe 'el7.x' do
      before { facts[:operatingsystemmajrelease] = '7' }
  
#      it { should contain_class('ipmi::install') }
      it { should contain_package('OpenIPMI').with_ensure('present') }
      it { should contain_package('ipmitool').with_ensure('present') }
    end
  end

end
