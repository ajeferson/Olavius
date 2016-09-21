module ReportConcern extend ActiveSupport::Concern

class_methods do

  def reasons_options_for_select
    keys = Report.reasons.keys
    keys.map { |key| [I18n.t("activerecord.enums.report.reasons.#{key}"), key] }
  end

end

end