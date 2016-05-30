# -*- encoding : utf-8 -*-

class HlaFactor < Dictionary

  has_many :donor_hla, class_name: 'Donor', inverse_of: :hla_factor

  rails_admin do
    label I18n.t('activerecord.models.hla_factor')
    label_plural I18n.t('activerecord.models.hla_factor')
    weight 231

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