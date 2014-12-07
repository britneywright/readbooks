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
    expect(page).to have_button("Reserve Book")
  end

  def reserve_book
    fill_in "Borrower name", :with => "Sarah"
    fill_in "Borrower email", :with => "sarah@example.com"
    fill_in "Borrower phone", :with => "1234567899"
    click_button("Reserve Book")
  end

  def confirmed_reservation
    expect(page).to have_text("Reservation submitted successfully.")
  end

  def confirmation_email
    expect(ActionMailer::Base.deliveries.last.subject).to eq("Rails Girls DC Library Request Received")
    expect(ActionMailer::Base.deliveries.last.body.encoded).to include("The Little Book of Talent")
    expect(ActionMailer::Base.deliveries.last.body.encoded).to have_link("login")
  end

  def view_reservation_request
    page.driver.browser.authorize ENV['KEY1'], ENV['KEY2']
    visit statuses_path
  end

  def assign_copy
    click_link("The Little Book of Talent", match: :first)
    click_link("Edit", match: :first)
    select("1: true", :from => "Copy")
    fill_in "Checked out", :with => Date.today
    click_button("Update Status") 
  end

  def checked_out
    visit root_path
    click_link("The Little Book of Talent")
    expect(page).to have_text("Sorry, this book is not available right now.")
  end

  def check_in
    page.driver.browser.authorize ENV['KEY1'], ENV['KEY2']
    visit statuses_path
    click_link("The Little Book of Talent", match: :first)
    click_link("Edit", match: :first)
    fill_in "Checked in", :with => Date.tomorrow
    click_button("Update Status")         
    visit root_path
    click_link("The Little Book of Talent")
    expect(page).to have_text("Reserve this book")
  end

end