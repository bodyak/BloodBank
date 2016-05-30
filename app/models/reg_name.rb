# -*- encoding : utf-8 -*-

class RegName < Dictionary

  has_many :donor_reg_name, class_name: 'Donor', inverse_of: :reg_name
  has_many :visit_reg_name, class_name: 'Visit', inverse_of: :reg_name
  has_many :visitation_reg_name, class_name: 'Visitation', inverse_of: :reg_name
  has_many :skin_reg_name, class_name: 'Skin', inverse_of: :reg_name

  rails_admin do
    label I18n.t('activerecord.models.reg_name')
    label_plural I18n.t('activerecord.models.reg_name')
    weight 228

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