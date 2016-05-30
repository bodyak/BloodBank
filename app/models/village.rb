# -*- encoding : utf-8 -*-

class Village < Dictionary

  has_many :donor_village, class_name: 'Donor', inverse_of: :village
  has_many :visit_village, class_name: 'Visit', inverse_of: :village
  has_many :visitation_village, class_name: 'Visitation', inverse_of: :village
  has_many :visit_send_village, class_name: 'Visit', inverse_of: :send_village
  has_many :visitation_send_village, class_name: 'Visitation', inverse_of: :send_village
  has_many :skin_village, class_name: 'Skin', inverse_of: :send_village

  rails_admin do
    label I18n.t('activerecord.models.village')
    label_plural I18n.t('activerecord.models.village')
    weight 222

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