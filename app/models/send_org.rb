# -*- encoding : utf-8 -*-

class SendOrg < Dictionary

  has_many :visit_send_organization, class_name: 'Visit', inverse_of: :send_org
  has_many :visitation_send_organization, class_name: 'Visitation', inverse_of: :send_org

  rails_admin do
    label I18n.t('activerecord.models.send_org')
    label_plural I18n.t('activerecord.models.send_org')
    weight 211

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