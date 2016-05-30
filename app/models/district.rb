# -*- encoding : utf-8 -*-

class District < Dictionary

  has_many :donor_district, class_name: 'Donor', inverse_of: :district
  has_many :visit_district, class_name: 'Visit', inverse_of: :district
  has_many :visitation_district, class_name: 'Visitation', inverse_of: :district
  has_many :skin_district, class_name: 'Skin', inverse_of: :district

  rails_admin do
    label I18n.t('activerecord.models.district')
    label_plural I18n.t('activerecord.models.district')
    weight 229

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