# -*- encoding : utf-8 -*-

class DonationType < Dictionary

  has_many :visit_donation_type, class_name: 'Visit', inverse_of: :donation_type

  rails_admin do
    label I18n.t('activerecord.models.donation_type')
    label_plural I18n.t('activerecord.models.donation_type')
    weight 204

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