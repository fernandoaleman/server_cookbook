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
