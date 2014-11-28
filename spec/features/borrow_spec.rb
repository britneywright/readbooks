require 'rails_helper'
require 'support/request_helper'

feature "Borrow" do
  include RequestHelper

  scenario "I'm coming to the Library to see what books I can borrow" do
    books_are_added
    go_to_website
    list_of_books
    go_to("The Little Book of Talent")
    view_details
    books_are_available
    click_borrow_button
    reservation_page
  # they are on a form with the name of the book and an explanation of the checkout process
  # they fill in their name/email/phone
  # they click the confirm button
  # they are on a "thanks" page with some follow up info of what to expect

  # britney receives an email with the subject "Sarah wants to borrow The Little Book of Talent"
  # the body includes sarah's personal info and the book info
  # and a link to the status page
  # britney interacts w/ sarah and gives her the book
  # britney goes to the status to include the checkout date and the copy id
  # the quantity is shown to have decreased by one

  # sarah returns the book
  # britney edits the status again, this time adding the checkin date
  # the quantity is shown to have increased by one
  end

end