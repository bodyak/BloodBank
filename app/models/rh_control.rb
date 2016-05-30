# -*- encoding : utf-8 -*-

class RhControl < Dictionary

  has_many :visit_rh_control, class_name: 'Visit', inverse_of: :rh_control
  has_many :visitation_rh_control, class_name: 'Visitation', inverse_of: :rh_control

  rails_admin do
    label I18n.t('activerecord.models.rh_control')
    label_plural I18n.t('activerecord.models.rh_control')
    weight 213

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