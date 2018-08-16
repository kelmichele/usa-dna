module ApplicationHelper
	def phone
	  number_to_phone(8662125426, delimiter: ' ', area_code: true,  class: "phone-link", id: "number_link", onclick: "ga('send', 'event', 'Phone Number', 'Clicked to Call', 'Number on Website', '1')")
	end
end
