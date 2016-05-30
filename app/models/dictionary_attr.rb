# -*- encoding : utf-8 -*-

class DictionaryAttr < ActiveRecord::Base

  serialize :dyn_attrs, OpenStruct

  attr_accessible :dyn_attrs

  belongs_to :dictionary

  validates :dictionary_id, presence: true

end