# 
class PayoutsController < ApplicationController
  def index
  end

  def payout_error
  end

  def payout_success
    @payout_data = params
  end

  def save_data
    logger.debug params
  end
end
