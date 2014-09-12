require 'spec_helper'

describe "ShowsPages" do

  subject { page }

  describe "current show (home) page" do
    before { visit root_path }
    it { should have_content('Current show') }
  end

  describe "show index page" do
    before { visit shows_path }
    it { should have_content('Past shows') }
    it { should have_content('Upcoming shows') }
  end

end
