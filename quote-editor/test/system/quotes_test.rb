require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = Quote.ordered.first
  end

  test "Creating a new quote" do
    #When we visit the Quotes#index page
    #we expect to see a title with the text "Quotes"
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # When we click on the link with the text "New Quote"
    # we expect to land on a page with the title "New Quote"
    click_on "New Quote"
    fill_in "Name", with: "Capybara quote"

    # While in the same page, click on "Create quote"
    assert_selector "h1", text: "Quotes"
    click_on "Create quote"

    # The result is a new quote with the text "Capybara quote"
    assert_selector "a", text: "Capybara quote"
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

    #When we click "Edit" on a quote, we can fill the field with "Updated quote"
    click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"

    # After editing the field, we can click on the "Update quote" button
    assert_selector "h1", text: "Quotes"
    click_on "Update quote"

    # The result is a new quote with the text "Updated quote"
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
