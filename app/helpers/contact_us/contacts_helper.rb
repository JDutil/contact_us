module ContactUs::ContactsHelper
  def clear_div
    %Q{<div style="clear: both; height: 0px; line-height: 0px;" class="clear">&nbsp;</div>}.html_safe
  end
end
