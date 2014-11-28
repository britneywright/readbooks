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

  def view_details
    expect(page).to have_text("The Little Book of Talent")
    expect(page).to have_text("2014")
  end

  def books_are_available
    expect(page).to have_text("Reserve this book")
  end

  def click_borrow_button
    first(:link, "Reserve this book").click
  end

  def reservation_page
    expect(page).to have_text("New Reservation")
    expect(page).to have_text("Borrower name")
    expect(page).to have_text("Borrower email")
    expect(page).to have_text("Borrower phone")
    expect(page).to have_button("Reserve Book")
  end
end