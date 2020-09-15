require 'spec_helper'

describe 'server::default' do
  platform 'centos'

  context 'with default attributes' do
    it { is_expected.to install_package('epel-release') }
    it { is_expected.to install_build_essential('server') }
    it { is_expected.to install_package(%w(htop ncdu the_silver_searcher)) }
    it { is_expected.to remove_package(%(sendmail)) }
    it { is_expected.to set_timezone('UTC') }

    it do
      is_expected.to create_template('/etc/profile.d/history_time_format.sh')
        .with_variables(
          'env_vars' => {
            'histtimeformat' => '%Y-%m-%d_%H:%M:%S',
          }
        )
    end
  end
end
