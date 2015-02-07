require "test_helper"

def sign_in
  visit "/login"
  fill_in "email", with: "morrissey@example.com"
  fill_in "password", with: "miserable-lie"
  click_button "Login"
end

feature "Admin::AdminAreaWithJs" do

  scenario "correctly delete article", js: true do
    sign_in
    visit "/blog/admin/articles/new"
    page.must_have_content "New Article"
    fill_in "article_title", with: "There Is A Light That Never Goes Out"
    click_button "Submit"
    visit "/blog/admin/articles"
    page.must_have_content "There Is A Light That Never Goes Out"
    page.all('.btn-danger')[0].click
    fill_in "verification", with: "There Is A Light That Never Goes Out"
    page.must_have_selector(:link_or_button, "Confirm")
    click_button "Confirm"
    visit "/blog/admin/articles"
    page.wont_have_content "There Is A Light That Never Goes Out"
  end

  scenario "cannot delete article without filling verification field", js: true do
    sign_in
    visit "/blog/admin/articles"
    page.all('.btn-danger')[0].click
    page.wont_have_selector(:link_or_button, "Confirm")
  end

  scenario "correctly delete image", js: true do
    sign_in
    visit "/blog/admin/images/new"
    page.must_have_content "New Image"
    fill_in "image_label", with: "Strangeways, Here We Come"
    attach_file "image_image_file", "#{Bigmouth::Engine.root}/test/features/bigmouth/admin/strangeways_here_we_come.jpg"
    click_button "Submit"
    page.must_have_content "Image URL"
    visit "/blog/admin/images"
    page.must_have_content "Strangeways, Here We Come"
    page.all('.btn-danger')[0].click
    fill_in "verification", with: "Strangeways, Here We Come"
    page.must_have_selector(:link_or_button, "Confirm")
    click_button "Confirm"
    visit "/blog/admin/images"
    page.wont_have_content "Strangeways, Here We Come"
  end

  scenario "cannot delete image without filling verification field", js: true do
    sign_in
    visit "/blog/admin/images"
    page.all('.btn-danger')[0].click
    fill_in "verification", with: "---"
    page.wont_have_selector(:link_or_button, "Confirm")
  end
end
