feature "Remove Bookmarks" do
  scenario "You can remove a bookmark from the list" do
    visit("/bookmarks")
    # find(".'3'").click
    find_button(class: "id-3").click
    expect(page).not_to have_link("Google", href: "http://www.google.com")
  end
end
