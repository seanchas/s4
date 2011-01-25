class ReportsController < ApplicationController
  
  def index
    @organization   = S4::Organization.find(s4_user)
    @weekly_reports = Reports::WeeklyReport.all(s4_user)
  end
  
end
