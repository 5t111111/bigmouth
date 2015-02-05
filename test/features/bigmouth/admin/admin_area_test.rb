require "test_helper"

feature "Admin::AdminArea" do
  scenario "redirect to sign in page without logging in" do
    visit "/blog/admin"
    page.must_have_content "Login"
    visit "/blog/admin/articles"
    page.must_have_content "Login"
    visit "/blog/admin/images"
    page.must_have_content "Login"
  end

  scenario "display admin page when logging in" do
    visit "/login"
    fill_in "email", with: "morrissey@example.com"
    fill_in "password", with: "miserable-lie"
    click_button "Login"
    visit "/blog/admin"
    # save_and_open_page
    page.must_have_content "Bigmouth Admin"
    Capybara.reset_sessions!
  end
end
