class QuotesController < ApplicationController
  before_action :set_quote, only: [ :show, :edit, :update, :destroy ]


  def index
    @quotes = current_company.quotes.ordered
  end

  def show

  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = current_company.quotes.build(quote_params)

    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was sucessfully created." }
        format.turbo_stream { flash.now[:notice] = "Quote was sucessfully created." }
        #Redirect the response to the Turbo Stream view of the same name
        #allowing for partial page updates without a full page reload.
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @quote.update(quote_params)
      respond_to do |format|
        format.html { redirect_to quote_path, notice: "Quote was sucessfully updated." }
        format.turbo_stream { flash.now[:notice] = "Quote was sucessfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was sucessfully deleted." }
      format.turbo_stream { flash.now[:notice] = "Quote was sucessfully deleted." }
    end
  end

  private

  def set_quote
    @quote = current_company.quotes.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
