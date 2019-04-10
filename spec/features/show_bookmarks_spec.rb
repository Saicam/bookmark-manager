feature 'visiting the homepage' do
  scenario 'the page title is visible' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature "Show Bookmarks" do
  scenario "It shows the bookmarks list" do
    visit("/bookmarks")
    expect(page).to have_content "List of bookmarks:"
    expect(page).to have_link("Google", href: "http://www.google.com")
    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")

  end
end
