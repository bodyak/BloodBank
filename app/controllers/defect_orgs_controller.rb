class DefectOrgsController < DictionariesController

  record_select full_text_search: true, search_on: :value_name, order_by: :value_name

  active_scaffold :defect_org do |config|

  end

end