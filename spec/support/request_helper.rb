module RequestHelper
  def books_are_added
    create_books("The Little Book of Talent")
  end

  def create_books(*titles)
    titles.each { |title| FactoryGirl.create(:book, title: title)}
  end

  def go_to_website
    visit root_path
  end

  def list_of_books
    expect(page).to have_text("The Little Book of Talent")
  end

  def go_to(title)
    click_link(title)
  end

  def view(title)
    expect(current_path).to eq(book_path(Book.find_by!(title: title)))
  end

  def view_details
    expect(page).to have_text("The Little Book of Talent")
    expect(page).to have_text("2014")
    save_and_open_page
  end

  def books_are_available
    expect(:book).copies.available.count
  end
end