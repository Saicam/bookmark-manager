feature "Remove Bookmarks" do
  scenario "You can remove a bookmark from the list" do
    visit("/bookmarks")
    expect(page).to have_link("Google", href: "http://www.google.com")
    find_button(class: "id-3").click
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("Google", href: "http://www.google.com")
  end
end
