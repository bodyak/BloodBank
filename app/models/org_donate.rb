# -*- encoding : utf-8 -*-

class OrgDonate < Dictionary

  has_many :donor_organization, class_name: 'Donor', inverse_of: :org_donate

  rails_admin do
    label I18n.t('activerecord.models.org_donate')
    label_plural I18n.t('activerecord.models.org_donate')
    weight 212

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