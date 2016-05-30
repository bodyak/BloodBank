# -*- encoding : utf-8 -*-

class Region < Dictionary

  has_many :donor_region, class_name: 'Donor', inverse_of: :region
  has_many :visit_region, class_name: 'Visit', inverse_of: :region
  has_many :visitation_region, class_name: 'Visitation', inverse_of: :region
  has_many :skin_region, class_name: 'Skin', inverse_of: :region

  rails_admin do
    label I18n.t('activerecord.models.region')
    label_plural I18n.t('activerecord.models.region')
    weight 224

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