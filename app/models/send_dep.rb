# -*- encoding : utf-8 -*-

class SendDep < Dictionary

  has_many :visit_send_department, class_name: 'Visit', inverse_of: :send_dep
  has_many :visitation_send_department, class_name: 'Visitation', inverse_of: :send_dep

  rails_admin do
    label I18n.t('activerecord.models.send_dep')
    label_plural I18n.t('activerecord.models.send_dep')
    weight 201

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