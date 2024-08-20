class LineItemDatesController < ApplicationController

  before_action :set_quote
  before_action :set_line_item_date, only: [:edit, :update, :destroy]

  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)

    if @line_item_date.save
      respond_to do |format|
        format.html { redirect_to @quote, notice: "Successfully created line item date" }
        format.turbo_stream { flash.now[:notice] = "Successfully created line item date" }
        # format.turbo_stream { render turbo_stream: [
        #   turbo_stream.prepend("dates", partial: "line_item_dates/line_item_date", locals: { quote: @quote, line_item_date: @line_item_date }),
        #   turbo_stream.update(LineItemDate.new, "")
        #   ]}
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @line_item_date.update(line_item_date_params)
      respond_to do |format|
        format.html { redirect_to @quote, notice: "Successfully updated date" }
        format.turbo_stream { flash.now[:notice] = "Successfully updated date" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item_date.destroy
    respond_to do |format|
      format.html { redirect_to @quote, notice: "Deleted date successfully" }
      format.turbo_stream { flash.now[:notice] = "Deleted date successfully" }
    end
  end

  private 

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:id])
  end

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end
end
