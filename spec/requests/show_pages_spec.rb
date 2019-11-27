require 'spec_helper'

describe "ShowsPages" do

  subject { page }

  xdescribe "current show (home) page" do
    before { visit '/' }
    it { should have_content('Current show') }
  end

  xdescribe "show index page" do
    before { visit '/shows/ind_current' }
    it { should have_content('Past shows') }
    it { should have_content('Upcoming shows') }
  end
end
