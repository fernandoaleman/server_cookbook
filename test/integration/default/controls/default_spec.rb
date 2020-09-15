control 'epel' do
  title 'Ensure epel package and repo are installed.'
  impact 1.0

  describe package('epel-release') do
    it { should be_installed }
  end

  describe yum.repo('epel') do
    it { should exist }
    it { should be_enabled }
  end
end

control 'build_essential' do
  title 'Ensure build essential packages are installed.'
  impact 1.0

  %w(
    autoconf
    bison
    flex
    gcc
    gcc-c++
    gettext
    kernel-devel
    make
    m4
    ncurses-devel
    patch
  ).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end

control 'packages' do
  title 'Ensure packages are installed and removed.'
  impact 1.0

  %w(htop ncdu the_silver_searcher).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end

  describe package('sendmail') do
    it { should_not be_installed }
  end
end

control 'bashrc' do
  title 'Ensure aliases are added to bashrc'
  impact 1.0

  describe file('/etc/bashrc') do
    its('content') { should include %q(alias ll='ls -alhH --color=auto') }
  end
end

control 'timezone' do
  title 'Ensure timezone is set.'
  impact 1.0

  describe command('date') do
    its('stdout') { should include 'UTC' }
  end
end

control 'history_time_format' do
  title 'Ensure history time format is set.'
  impact 1.0

  describe file('/etc/profile.d/history_time_format.sh') do
    it { should exist }
    its('content') { should include 'export HISTTIMEFORMAT="%Y-%m-%d_%H:%M:%S"' }
  end
end

control 'ssh_known_hosts' do
  title 'Ensure ssh known hosts are added.'
  impact 1.0

  describe package('openssh-clients') do
    it { should be_installed }
  end

  describe file('/etc/ssh/ssh_known_hosts') do
    it { should exist }
    its('content') { should include 'github.com' }
  end
end

control 'default_editor' do
  title 'Ensure default editor is set.'
  impact 1.0

  describe file('/etc/profile.d/editor.sh') do
    it { should exist }
    its('content') { should include 'export EDITOR="vim"' }
    its('content') { should include 'export VISUAL="vim"' }
  end
end
