# -*- encoding : utf-8 -*-

class TypePacking < Dictionary

  has_many :visit_type_packing, class_name: 'Visit', inverse_of: :type_packing

  rails_admin do
    label I18n.t('activerecord.models.type_packing')
    label_plural I18n.t('activerecord.models.type_packing')
    weight 206

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