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
    @image = bigmouth_images(:the_queen_is_dead)
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
    page.must_have_content("There Is A Light That Never Goes Out")
  end

  scenario "display images page when logging in" do
    sign_in
    visit "/blog/admin/images"
    page.must_have_content "Images"
  end

  scenario "correctly display image page" do
    sign_in
    visit "/blog/admin/images/#{@image.id}"
    page.must_have_content "Image URL"
  end

  scenario "correctly create new image" do
    sign_in
    visit "/blog/admin/images/new"
    page.must_have_content "New Image"
    fill_in "image_label", with: "Strangeways, Here We Come"
    attach_file "image_image_file", "#{Bigmouth::Engine.root}/test/features/bigmouth/admin/strangeways_here_we_come.jpg"
    click_button "Submit"
    page.must_have_content "Image URL"
  end

  scenario "correctly edit image" do
    sign_in
    visit "/blog/admin/images/#{@image.id}/edit"
    page.must_have_content "Editing Image"
    fill_in "image_label", with: "Meat Is Murder"
    attach_file "image_image_file", "#{Bigmouth::Engine.root}/test/features/bigmouth/admin/meat_is_murder.jpg"
    click_button "Submit"
    page.must_have_content "Image URL"
  end
end
