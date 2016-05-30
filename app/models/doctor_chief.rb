# -*- encoding : utf-8 -*-

class DoctorChief < Dictionary

  has_many :donor_chief, class_name: 'Donor', inverse_of: :doctor_chief

  rails_admin do
    label I18n.t('activerecord.models.doctor_chief')
    label_plural I18n.t('activerecord.models.doctor_chief')
    weight 223

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