# -*- encoding : utf-8 -*-

class Country < Dictionary

  has_many :donor_country, class_name: 'Donor', inverse_of: :country
  has_many :visit_country, class_name: 'Visit', inverse_of: :country
  has_many :visitation_country, class_name: 'Visitation', inverse_of: :country
  has_many :skin_country, class_name: 'Skin', inverse_of: :country

  rails_admin do
    label I18n.t('activerecord.models.country')
    label_plural I18n.t('activerecord.models.country')
    weight 214

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