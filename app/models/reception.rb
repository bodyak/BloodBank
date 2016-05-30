# -*- encoding : utf-8 -*-

class Reception < Dictionary

  attr_accessor :date_reception, :village_reception, :check_out_reception

  attr_accessible :date_reception, :village_reception, :check_out_reception

  has_many :visit_reception, class_name: 'Visit', inverse_of: :reception
  has_many :visitation_reception, class_name: 'Visitation', inverse_of: :reception

  validates :village_reception, presence: true, if: proc {self.check_out_reception == '1'}
  validates :date_reception, presence: true, if: proc {self.check_out_reception == '1'}

  after_initialize do
    dict_attr = DictionaryAttr.find_by_dictionary_id(id)
    unless dict_attr.blank?
      self.village_reception = dict_attr.dyn_attrs.village_reception
      self.check_out_reception = dict_attr.dyn_attrs.check_out_reception
      self.date_reception = dict_attr.dyn_attrs.date_reception
    end
  end

  before_validation do
    self.value_name = I18n.t('activerecord.attributes.reception.check_out_reception') if check_out_reception == '1'
    begin
      self.date_reception = date_reception.blank? ? nil : Date.strptime(date_reception.to_s, I18n.t('date_validation.format'))
    rescue ArgumentError
      self.date_reception = Time.now
    end
  end

  after_validation do
    if check_out_reception == '1'
      self.value_name = [date_reception.blank? ? I18n.t('reception.no_date_reception') : date_reception.to_date.strftime('%d-%m-%Y'),
                         village_reception.blank? ? I18n.t('reception.no_village_reception') : village_reception].join('/')
    end
  end

  after_save do
    if check_out_reception == '1'
      dict_attr = DictionaryAttr.find_by_dictionary_id(id)
      if dict_attr.blank?
        dict_attr = DictionaryAttr.new
        dict_attr.dictionary_id = id
        dict_attr.dyn_attrs.check_out_reception = check_out_reception
        dict_attr.dyn_attrs.date_reception = date_reception
        dict_attr.dyn_attrs.village_reception = village_reception
        dict_attr.save
      else
        dict_attr.dyn_attrs.check_out_reception = check_out_reception
        dict_attr.dyn_attrs.date_reception = date_reception
        dict_attr.dyn_attrs.village_reception = village_reception
        DictionaryAttr.update(dict_attr.id, dyn_attrs: dict_attr.dyn_attrs)
      end
    else
      dict_attr = DictionaryAttr.find_by_dictionary_id(self.id)
      unless dict_attr.blank?
        DictionaryAttr.delete(dict_attr.id)
      end
    end
  end

  def name
    if dictionary_attr.blank?
      value_name.blank? ? I18n.t('dictionary.no_value') : value_name
    else
      '(' + [I18n.t('activerecord.attributes.reception.check_out_reception'),
      dictionary_attr.dyn_attrs.date_reception.to_date.strftime('%d-%m-%Y'),
      dictionary_attr.dyn_attrs.village_reception].join('/') + ')'
    end
  end

  rails_admin do
    label I18n.t("activerecord.models.reception")
    label_plural I18n.t("activerecord.models.receptions")
    weight 221

    configure :date_reception do
      label I18n.t('activerecord.attributes.reception.date_reception')
      pretty_value do
        bindings[:object].date_reception.blank? ? nil : bindings[:object].date_reception.to_date.strftime('%d-%m-%Y')
      end
    end
    configure :village_reception do
      label I18n.t('activerecord.attributes.reception.village_reception')
    end
    configure :check_out_reception do
      label I18n.t('activerecord.attributes.reception.check_out_reception')
      pretty_value do
        bindings[:object].check_out_reception == '1' ? I18n.t('for_select.verify.verity') : I18n.t('for_select.verify.lie')
      end
    end

    list do
      sort_by :value_name

      field :value_name
      field :check_out_reception
      field :date_reception
      field :village_reception
    end

    show do
      field :value_name
      field :check_out_reception
      field :date_reception
      field :village_reception
    end

    edit do
      field :value_name
      field :check_out_reception, :boolean
      field :date_reception, :date
      field :village_reception, :enum do
        enum do
          Village.pluck(:value_name)
        end
      end
    end
  end

end