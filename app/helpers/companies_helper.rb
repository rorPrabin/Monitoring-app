module CompaniesHelper
	def custom_error_messages_helper(company)
  html = ""
  html << '<div class="errors">'
  company.errors.each do |attr, error|
    if !(attr =~ /\./)
      html << '<div class="error">'
      html << error
      html << '</div>'
    end
  end
 html << '</div>'
end
end
