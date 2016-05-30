# -*- encoding : utf-8 -*-

class DoctorDonation < Dictionary

  has_many :visit_doctor_donation, class_name: 'Visit', inverse_of: :doctor_donation

  rails_admin do
    label I18n.t('activerecord.models.doctor_donation')
    label_plural I18n.t('activerecord.models.doctor_donation')
    weight 202

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