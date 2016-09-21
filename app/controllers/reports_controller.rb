class ReportsController < ApplicationController

  load_and_authorize_resource :post, only: [:create]
  load_and_authorize_resource :report, through: :post, shallow: true

  load_and_authorize_resource except: [:create]

  # GET /reports
  def index
    @reports = @reports.order(created_at: :desc)
  end

  # POST /posts/:post_id/reports
  def create
    @report.user = current_user
    @report.save
  end

  private

  def report_params
    params.require(:report).permit(:reason, :body)
  end

end
