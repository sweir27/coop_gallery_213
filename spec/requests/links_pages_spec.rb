require 'spec_helper'

describe "LinksPages" do
  subject { page }

  describe "links page" do
    before { visit '/links' }
    it { should have_title('Community') }
  end
end
