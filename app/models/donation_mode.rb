# -*- encoding : utf-8 -*-

class DonationMode < Dictionary

  has_many :visit_donation_mode, class_name: 'Visit', inverse_of: :donation_mode

  rails_admin do
    label I18n.t('activerecord.models.donation_mode')
    label_plural I18n.t('activerecord.models.donation_mode')
    weight 205

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