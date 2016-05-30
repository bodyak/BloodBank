# -*- encoding : utf-8 -*-

class BloodGroup < Dictionary

  has_many :donor_blood, class_name: 'Donor', inverse_of: :blood_group
  has_many :visit_blood, class_name: 'Visit', inverse_of: :blood_group
  has_many :visitation_blood, class_name: 'Visitation', inverse_of: :blood_group
  has_many :visit_control_blood, class_name: 'Visit', inverse_of: :control_blood
  has_many :visitation_control_blood, class_name: 'Visitation', inverse_of: :control_blood

  rails_admin do
    label I18n.t('activerecord.models.blood_group')
    label_plural I18n.t('activerecord.models.blood_group')
    weight 207

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