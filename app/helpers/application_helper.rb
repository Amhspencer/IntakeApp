module ApplicationHelper
  def get_statistics
    stat = Hash.new
    stat[:total_active] = (User.find_all_by_active(true)).length
    stat[:total_inactive] = (User.find_all_by_active(false)).length
    stat[:total_user] = (User.all).length
    stat[:total_admin] = (User.find_all_by_type("Admin")).length
    stat[:total_staff] = (User.find_all_by_type("Staff")).length
    stat[:total_partner] = (User.find_all_by_type("Partner")).length
    stat[:total_processed] = (Form.find_all_by_processed(true)).length
    stat[:total_unprocessed] = (Form.find_all_by_processed(false)).length
    stat[:total_form] = (Form.all).length
    stat[:total_processed_user] = (@user.forms.select{ |f| f.processed == true }).length
    stat[:total_unprocessed_user] = (@user.forms.select{ |f| f.processed == false }).length
    return stat
  end

end
