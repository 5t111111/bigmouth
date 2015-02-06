require "test_helper"

def sign_in
  visit "/login"
  fill_in "email", with: @user[Bigmouth.config.username_key.to_sym]
  fill_in "password", with: "miserable-lie"
  click_button "Login"
end

feature "Admin::AdminArea" do
  before do
    @article = bigmouth_articles(:bigmouth_Strikes_again)
    @user = users(:morrissey)
  end

  scenario "redirect to sign in page without logging in" do
    visit "/blog/admin"
    page.must_have_content "Login"
    visit "/blog/admin/articles"
    page.must_have_content "Login"
    visit "/blog/admin/images"
    page.must_have_content "Login"
  end

  scenario "display admin page when logging in" do
    sign_in
    visit "/blog/admin"
    # save_and_open_page
    page.must_have_content "Bigmouth Admin"
    # Capybara.reset_sessions!
  end

  scenario "display articles page when logging in" do
    sign_in
    visit "/blog/admin/articles"
    page.must_have_content "Articles"
  end

  scenario "correctly display article page" do
    sign_in
    visit "/blog/admin/articles/#{@article.id}"
    page.must_have_content "Bigmouth Strikes Again"
  end

  scenario "correctly create new article" do
    sign_in
    visit "/blog/admin/articles/new"
    page.must_have_content "New Article"
    fill_in "article_title", with: "There Is A Light That Never Goes Out"
    fill_in "article_text", with: <<EOS
Take me out tonight 
Where there's music and there's people 
And they're young and alive 
Driving in your car 
I never never want to go home 
Because I haven't got one 
Anymore
EOS
    click_button "Submit"
    page.must_have_content("by #{@user[Bigmouth.config.username_key.to_sym]}")
  end

  scenario "correctly edit article" do
    sign_in
    visit "/blog/admin/articles/#{@article.id}/edit"
    page.must_have_content "Editing Article"
    fill_in "article_title", with: "There Is A Light That Never Goes Out"
    fill_in "article_text", with: <<EOS
Take me out tonight 
Where there's music and there's people 
And they're young and alive 
Driving in your car 
I never never want to go home 
Because I haven't got one 
Anymore
EOS
    click_button "Submit"
    page.must_have_content("by #{@user[Bigmouth.config.username_key.to_sym]}")
  end

  scenario "correctly destroy article" do
    sign_in
    visit "/blog/admin/articles/#{@article.id}"
    click_button "Submit"
    page.must_have_content("by #{@user[Bigmouth.config.username_key.to_sym]}")
  end
end
