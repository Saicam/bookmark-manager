feature "Add Bookmarks" do
  scenario "You can add a new bookmark and list it" do
    visit("/bookmarks/add")
    fill_in :bookmark_url, with: "https://www.bbc.co.uk"
    fill_in :bookmark_title, with: "BBC"
    click_button "Add"
    expect(page).to have_link("BBC", href: "https://www.bbc.co.uk")
  end
end
