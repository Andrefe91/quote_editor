class ApplicationController < ActionController::Base
  before_action :set_quote, only: [ :show, :edit, :update, :destroy ]
  def Index
    @quotes = Quotes.all
  end

  def show

  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: "Quote was sucessfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @quote.update(quote_params)
      redirect_to quote_path, notice: "Quote was sucessfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: "Quote was sucessfully deleted."
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
