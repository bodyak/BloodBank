# -*- encoding : utf-8 -*-

class Dictionary < ActiveRecord::Base

  attr_accessible :glossary_id, :value_name, :position, :ancestry, :type

  has_one :dictionary_attr

  belongs_to :glossary

  validates :value_name, presence: true

  before_save do
    self.glossary_id = Glossary.find_by_name_type(self.type).id
  end

  def name
    (self.value_name.blank? ? I18n.t('dictionary.no_value') : self.value_name) unless self.id.blank?
  end

  rails_admin do
    label I18n.t('activerecord.models.dictionaries')
    label_plural I18n.t('activerecord.models.dictionaries')
    weight 100

    list do
      sort_by :value_name

      field :value_name
    end

    show do
      field :value_name
    end
  end

end