# frozen_string_literal: true

class FeedbackController < ApplicationController
  before_action :authenticate_user!
  def new; end

  def create
    FeedbackMailer.feedback(current_user, feedback_text).deliver_now
    flash[:feedback] = t('.feedback')
    redirect_to root_path
  end

  def feedback_text
    params.require(:body)
  end
end
