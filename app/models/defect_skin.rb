# -*- encoding : utf-8 -*-

class DefectSkin < Dictionary

  has_many :skin_defect_skin, class_name: 'Skin', inverse_of: :defect_skin

  rails_admin do
    label I18n.t('activerecord.models.defect_skin')
    label_plural I18n.t('activerecord.models.defect_skin')
    weight 208

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