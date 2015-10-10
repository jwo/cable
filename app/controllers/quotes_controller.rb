class QuotesController < ApplicationController
  def dashboard
    @quotes = Quote.all.order('created_at desc')
  end
end
