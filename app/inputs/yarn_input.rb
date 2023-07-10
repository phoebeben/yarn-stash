class YarnCount < SimpleForm::Inputs::StringInput
  def input
    template.text_field_tag(quantity, input_options.delete(:value), input_html_options)
  end
end
