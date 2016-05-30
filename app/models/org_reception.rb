# -*- encoding : utf-8 -*-

class OrgReception < Dictionary

  has_many :visit_org_reception, class_name: 'Visit', inverse_of: :org_reception
  has_many :visitation_org_reception, class_name: 'Visitation', inverse_of: :org_reception

  rails_admin do
    label I18n.t('activerecord.models.org_reception')
    label_plural I18n.t('activerecord.models.org_reception')
    weight 225

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