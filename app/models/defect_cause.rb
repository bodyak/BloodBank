# -*- encoding : utf-8 -*-

class DefectCause < Dictionary

  has_many :donor_defect_cause, class_name: 'DonorDefect', inverse_of: :defect_cause
  has_many :visit_defect_cause, class_name: 'Visit', inverse_of: :defect_cause
  has_many :visitation_defect_cause, class_name: 'Visitation', inverse_of: :defect_cause

  rails_admin do
    label I18n.t('activerecord.models.defect_cause')
    label_plural I18n.t('activerecord.models.defect_cause')
    weight 227

    list do
      sort_by :value_name

      field :value_name
    end

    show do
      field :value_name
    end

    edit do
      field :value_name
    end
  end

end