# -*- encoding : utf-8 -*-

class DefectOrg < Dictionary

  has_many :donor_defect_org, class_name: 'DonorDefect', inverse_of: :defect_org
  has_many :skin_defect_org, class_name: 'Skin', inverse_of: :defect_org

  rails_admin do
    label I18n.t('activerecord.models.defect_org')
    label_plural I18n.t('activerecord.models.defect_org')
    weight 226

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