class CalendarController < ApplicationController
  before_action :authenticate_user!

  def index
    @date = if params[:date].present?
              Date.parse(params[:date])
            else
              Time.zone.today
            end
    @calendar = KarmaHrm::Calendar.new(@date).to_a
  end
end
