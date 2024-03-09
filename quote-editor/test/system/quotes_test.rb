require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first)
  end

  test "Creating a new quote" do
    #When we visit the Quotes#index page
    #we expect to see a title with the text "Quotes"
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # When we click on the link with the text "New Quote"
    # we expect to land on a page with the title "New Quote"
    click_on "New Quote"
    assert_selector "h1", text: "New Quote"

    # When we fill in the name input with "Capybara quote"
    # and we click on "Create quote"
    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"

    # We expect to be back on the page with the title "Quotes"
    # and to see our "Cabybara quote" added to the list
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    #When we visit the "Quotes#Index" page, and we click on a quote,
    # we land on a page with the title of the quote

    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    # When we visit the index of a page, we can see the text "Quotes"
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    #When we click "Edit" on a quote, we land on a page with the title "Edit quote"
    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit quote"

    # When we fill the updated name on a quote, we can click to update the quote
    fill_in "Name", with: "Updated quote"
    click_on "Update quote"

    # Back at the index page we can see the updated title with "Updated quote"
    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Deleting a quote" do
    #When we visit the index page, we can see quotes
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
