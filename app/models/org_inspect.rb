# -*- encoding : utf-8 -*-

class OrgInspect < Dictionary

  has_many :visit_inspect_syphilis, class_name: 'Visit', inverse_of: :org_syphilis
  has_many :visit_inspect_hep_c, class_name: 'Visit', inverse_of: :org_hep_c
  has_many :visit_inspect_hep_b, class_name: 'Visit', inverse_of: :org_hep_b
  has_many :visit_inspect_aids, class_name: 'Visit', inverse_of: :org_aids

  rails_admin do
    label I18n.t('activerecord.models.org_inspect')
    label_plural I18n.t('activerecord.models.org_inspect')
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