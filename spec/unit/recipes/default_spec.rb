require 'spec_helper'

describe 'server::default' do
  platform 'centos'

  context 'with default attributes' do
    it { is_expected.to install_package('epel-release') }
    it { is_expected.to install_build_essential('server') }
    it { is_expected.to install_package(%w(htop ncdu the_silver_searcher)) }
    it { is_expected.to remove_package(%(sendmail)) }
  end
end
