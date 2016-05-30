# -*- encoding : utf-8 -*-

class Glossary < ActiveRecord::Base

  has_ancestry

  attr_accessible :name, :name_type

  has_many :dictionaries

  rails_admin do
    label "Типи довідників"
    label_plural "Типи довідників"
    weight 300

    configure :name do
      label "Назва довідника"
    end
    configure :name_type do
      label "Код довідника"
    end

    list do
      sort_by :name

      field :name
      field :name_type
    end

    show do
      field :name
      field :name_type
    end

    edit do
      field :name
      field :name_type
    end
  end

end