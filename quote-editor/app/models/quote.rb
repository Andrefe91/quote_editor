class Quote < ApplicationRecord

  validates :name, presence: true

  scope :ordered, -> { order(created_at: :desc)}

  #Remmember, "puppies" can be anything, this is the name of the channel

  #after_create_commit -> { broadcast_prepend_later_to "puppies"}
  #after_update_commit -> { broadcast_replace_later_to "puppies" }
  # The broadcast_remove_later_to method does not exist because as the quote gets deleted from
  # the database, it would be impossible for a background job to retrieve this quote in the database later
  # to perform the job
  #after_destroy_commit -> { broadcast_remove_to "puppies" }

  #Above is the short version of this:

  #  after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self } }


  #Syntactic sugar for the three callbacks from before:

  broadcasts_to ->(quote) { "puppies" }, inserts_by: :prepend
end
