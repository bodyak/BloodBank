module ApplicationHelper

  def record_multi_select_field(name, current, options = {})
    options[:controller] ||= current.first.class.to_s.pluralize.underscore
    options[:params] ||= {}
    options[:id] ||= name.gsub(/[\[\]]/, '_')
    options[:class] ||= ''
    options[:class] << ' recordselect'
    options.delete(:name)

    controller = assert_controller_responds(options.delete(:controller))
    params = options.delete(:params)
    record_select_options = {}
    record_select_options[:current] = current.inject([]) { |memo, record| memo.push({:id => record.id, :label => label_for_field(record, controller)}) }

    html = text_field_tag("#{name}[]", nil, options.merge(:autocomplete => 'off', :onfocus => "this.focused=true", :onblur => "this.focused=false"))
    # delete next line is present in gem 'recordselect'
    # html << hidden_field_tag("#{name}[]", '', :id => nil)
    html << content_tag('ul', '', :class => 'record-select-list');

    url = url_for({:action => :browse, :controller => controller.controller_path}.merge(params))
    html << javascript_tag("new RecordSelect.Multiple(#{options[:id].to_json}, #{url.to_json}, #{record_select_options.to_json});")

    return html
  end

end
