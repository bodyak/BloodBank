module MigrationHelper

  def rewrite_null(param)
    param.blank? ? nil : param.strip
  end

  def rewrite_int(param)
    param.blank? ? nil : param.to_i
  end

  def rewrite_date(param)
    param.blank? ? nil : param.to_date
  end

  def rewrite_logical(param, for_true = true, for_false = false)
    case param
      when blank?
        nil
      when for_true
        true
      when for_false
        false
      else
        nil
    end
  end

  def rewrite_number(param, for_number, for_null)
    case param
      when blank?
        nil
      when for_number
        999
      when for_null
        0
      else
        nil
    end
  end

end