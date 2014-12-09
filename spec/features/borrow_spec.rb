require 'rails_helper'
require 'support/request_helper'

feature "Borrow" do
  include RequestHelper

  scenario "I'm coming to the Library to see books and borow one" do
    title = "The Little Book of Talent"
    create_books([title])
    go_to_website
    i_see_the_book(title)
    go_to(title)
    view_details
    books_are_available
    click_borrow_button
    reservation_page
    reserve_book
    confirmed_reservation
    confirmation_email
    # In Real Lfe: britney interacts w/ me and gives me the book
    view_reservation_request
    assign_copy
    checked_out
    # In Real Lfe: I return the book
    check_in
  end
end