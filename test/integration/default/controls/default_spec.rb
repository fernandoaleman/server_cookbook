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
