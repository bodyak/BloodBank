# -*- encoding : utf-8 -*-

class Doc < Dictionary

  has_many :donor_documents, class_name: 'DonorDocument', inverse_of: :doc

  rails_admin do
    label I18n.t('activerecord.models.doc')
    label_plural I18n.t('activerecord.models.doc')
    weight 203

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