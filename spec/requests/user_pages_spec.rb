require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit "/artists/#{user.id}" }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  xdescribe "signup" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      visit '/signin'
      fill_in "Email",        with: user.email.upcase
      fill_in "Password",     with: user.password
      click_button "Sign in"
      click_link "Create user"
    end

    let(:submit) { "Create user" }

    describe "signup page" do
      it { should have_content('Add user') }
      it { should have_title('Add user') }
    end

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Biography",    with: "biography"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end

    end
  end
end