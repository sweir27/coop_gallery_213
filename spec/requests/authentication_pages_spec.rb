require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit '/signin' }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end

  describe "signin" do
    before { visit '/signin' }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign in') }
      # it { should have_selector('div.alert.alert-error') }

      describe "after visiting another page" do
        before { click_link "Cooperative Gallery 213" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",        with: user.email.upcase
        fill_in "Password",     with: user.password
        click_button "Sign in"
      end

      it { should have_title(user.name) }
      it { should have_link('Admin', href: "/admin/users/#{user.id}/profile") }
      it { should have_link('Sign out', href: '/signout') }
      it { should_not have_link('Sign in', href: '/signin') }
    end
  end
end