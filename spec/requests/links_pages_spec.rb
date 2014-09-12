require 'spec_helper'

describe "LinksPages" do
  subject { page }

  describe "links page" do
    before { visit links_path }
    it { should have_content('Related links') }
  end
end
