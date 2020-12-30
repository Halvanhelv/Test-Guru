# frozen_string_literal: true

module Admin
  class BadgesController < ApplicationController
    before_action :set_badge, only: %i[index]
    layout 'admin'
    def index; end

    def new
      @badge = Badge.new
    end

    def create
      @badge = Badge.new(badge_params)

      if @badge.save
        redirect_to admin_badges_path(@badge), notice: t('.success')
      else
        render :new
      end
    end

    private

    def set_badge
      @badges = Badge.all
    end

    def badge_params
      params.require(:badge).permit(:title, :rule, :value, :img)
    end
  end
end
