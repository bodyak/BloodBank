class DateTimeValidator < ActiveModel::Validator

  def validate(record)
    options[:fields].each do |field|
      begin
        # gotta use the actual string and not the rails fucked time that it 'conveniently' converts to UTC
        record[field] = Date.strptime(record.send("#{field}_before_type_cast").to_s, I18n.t("date_validation.format")) unless record.send("#{field}_before_type_cast").to_s.blank?
      rescue ArgumentError
        record.errors.add(field, I18n.t("date_validation.error"))
      end
    end
  end

end