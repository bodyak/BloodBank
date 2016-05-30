# -*- encoding : utf-8 -*-

class DoctorTest < Dictionary

  has_many :visit_doctor_test, class_name: 'Visit', inverse_of: :doctor_test

  rails_admin do
    label I18n.t('activerecord.models.doctor_test')
    label_plural I18n.t('activerecord.models.doctor_test')
    weight 218

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