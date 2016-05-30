# -*- encoding : utf-8 -*-

class DoctorSkin < Dictionary

  has_many :visit_doctor_skin, class_name: 'Visit', inverse_of: :doctor_skin
  has_many :visitation_doctor_skin, class_name: 'Visitation', inverse_of: :doctor_skin

  rails_admin do
    label I18n.t('activerecord.models.doctor_skin')
    label_plural I18n.t('activerecord.models.doctor_skin')
    weight 216

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