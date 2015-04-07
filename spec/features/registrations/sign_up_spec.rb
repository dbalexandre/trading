require "rails_helper"

RSpec.feature "User sign up" do
  context "with valid information" do
    scenario "redirects to the home page" do
      visit root_path

      click_link "Registre-se"

      fill_in "Email", with: "john.doe@example.com"
      fill_in "Password", with: "password", match: :prefer_exact
      fill_in "Password confirmation", with: "password", match: :prefer_exact

      click_button "Sign up"

      expect(current_path).to eq root_path
      expect(page).to have_notice "Bem vindo! Você realizou seu registro com sucesso."
      expect(page).to have_content "john.doe@example.com"
    end
  end
end
