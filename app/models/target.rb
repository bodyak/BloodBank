# -*- encoding : utf-8 -*-

class Target < Dictionary

  has_many :visit_target, class_name: 'Visit', inverse_of: :target
  has_many :visitation_target, class_name: 'Visitation', inverse_of: :target

  rails_admin do
    label I18n.t('activerecord.models.target')
    label_plural I18n.t('activerecord.models.target')
    weight 220

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