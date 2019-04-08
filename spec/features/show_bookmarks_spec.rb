feature "Show Bookmarks" do
  scenario "It shows the bookmarks list" do
    visit("/bookmarks")
    expect(page).to have_content "List of bookmarks:"
  end
end
