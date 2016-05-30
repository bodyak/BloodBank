# -*- encoding : utf-8 -*-

class CatDonor < Dictionary

  has_many :donor_category, class_name: 'Donor', inverse_of: :cat_donor

  rails_admin do
    label I18n.t('activerecord.models.cat_donor')
    label_plural I18n.t('activerecord.models.cat_donor')
    weight 210

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