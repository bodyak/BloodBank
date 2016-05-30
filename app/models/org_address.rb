# -*- encoding : utf-8 -*-

class OrgAddress < Dictionary

  has_many :visit_organization_address, class_name: 'Visit', inverse_of: :org_address
  has_many :visitation_organization_address, class_name: 'Visitation', inverse_of: :org_address

  rails_admin do
    label I18n.t('activerecord.models.org_address')
    label_plural I18n.t('activerecord.models.org_address')
    weight 200

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