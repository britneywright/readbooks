require 'rails_helper'
require 'support/request_helper'

feature "Borrow" do
  include RequestHelper

  scenario "I'm coming to the Library to see books and borow one" do
    books_are_added
    go_to_website
    list_of_books
    go_to("The Little Book of Talent")
    view_details
    books_are_available
    click_borrow_button
    reservation_page
    reserve_book
    confirmed_reservation

  # britney receives an email with the subject "Sarah wants to borrow The Little Book of Talent"
  # the body includes sarah's personal info and the book info
  # and a link to the status page
  # britney interacts w/ sarah and gives her the book
    
    view_reservation_request
    assign_copy
    checked_out

  # sarah returns the book

    check_in
  end
end