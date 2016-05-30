# -*- encoding : utf-8 -*-

class RhFactor < Dictionary

  has_many :donor_rh, class_name: 'Donor', inverse_of: :rh_factor
  has_many :visit_rh, class_name: 'Visit', inverse_of: :rh_factor
  has_many :visitation_rh, class_name: 'Visitation', inverse_of: :rh_factor

  rails_admin do
    label I18n.t('activerecord.models.rh_factor')
    label_plural I18n.t('activerecord.models.rh_factor')
    weight 230

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