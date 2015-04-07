require "rails_helper"

RSpec.feature "User sign in" do
  before do
    create(:user, email: "john.doe@example.com", password: "password")
  end

  context "with valid credentials" do
    scenario "redirects to the home page" do
      visit root_path

      click_link "Login"

      fill_in "Email", with: "john.doe@example.com"
      fill_in "Password", with: "password"

      click_button "Log in"

      expect(current_path).to eq root_path
      expect(page).to have_notice "Login efetuado com sucesso."
      expect(page).to have_content "john.doe@example.com"
    end
  end

  context "with invalid credentials" do
    scenario "displays error message" do
      visit root_path

      click_link "Login"

      fill_in "Email", with: "foo@bar.com"
      fill_in "Password", with: "wrong"

      click_button "Log in"

      expect(page).to have_alert "Email ou senha inválidos."
    end
  end
end
