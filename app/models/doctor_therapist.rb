# -*- encoding : utf-8 -*-

class DoctorTherapist < Dictionary

  has_many :visit_doctor_therapist, class_name: 'Visit', inverse_of: :doctor_therapist
  has_many :visitation_doctor_therapist, class_name: 'Visitation', inverse_of: :doctor_therapist

  rails_admin do
    label I18n.t('activerecord.models.doctor_therapist')
    label_plural I18n.t('activerecord.models.doctor_therapist')
    weight 217

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