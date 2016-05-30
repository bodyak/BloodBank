# -*- encoding : utf-8 -*-

class BloodFor < Dictionary

  has_many :visit_blood_for, class_name: 'Visit', inverse_of: :blood_for

  rails_admin do
    label I18n.t('activerecord.models.blood_for')
    label_plural I18n.t('activerecord.models.blood_for')
    weight 215

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