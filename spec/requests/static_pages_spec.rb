require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "About page" do
    before { visit '/about' }
    it { should have_title('About the gallery') }
  end

  describe "Contact page" do
    before { visit '/contact' }
    it { should have_title('Contact the gallery') }
  end
end
