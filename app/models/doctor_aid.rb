# -*- encoding : utf-8 -*-

class DoctorAid < Dictionary

  has_many :visit_doctor_aid, class_name: 'Visit', inverse_of: :doctor_aid

  rails_admin do
    label I18n.t("activerecord.models.doctor_aid")
    label_plural I18n.t("activerecord.models.doctor_aids")
    weight 219

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