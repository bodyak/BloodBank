# -*- encoding : utf-8 -*-

class TargetSomeone < Dictionary

  has_many :visit_target_someone, class_name: 'Visit', inverse_of: :target_someone

  rails_admin do
    label I18n.t('activerecord.models.target_someone')
    label_plural I18n.t('activerecord.models.target_someone')
    weight 209

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