require 'spec_helper'

describe 'server::default' do
  platform 'centos'

  context 'with default attributes' do
    it { is_expected.to install_package('epel-release') }
    it { is_expected.to install_build_essential('server') }
  end
end
