class DoctorTestsController < DictionariesController

  record_select full_text_search: true, search_on: :value_name, order_by: :value_name

  active_scaffold :doctor_test do |config|

  end

end