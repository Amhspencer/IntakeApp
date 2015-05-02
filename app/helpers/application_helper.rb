module ApplicationHelper
  def get_statistics
    stat = Hash.new
    stat[:actives] = build_actives
    stat[:users] = build_users
    stat[:forms] = build_forms
    return stat
  end

  def build_actives
    actives = Hash.new
    actives[:total_active] = (User.find_all_by_active(true)).length
    actives[:total_inactive] = (User.find_all_by_active(false)).length
    return actives
  end

  def build_users
    users = Hash.new
    users[:total_user] = (User.all).length
    users[:total_admin] = (User.find_all_by_type("Admin")).length
    users[:total_staff] = (User.find_all_by_type("Staff")).length
    users[:total_partner] = (User.find_all_by_type("Partner")).length
    return users
  end

  def build_forms
    forms = Hash.new
    forms[:total_processed] = (Form.find_all_by_processed(true)).length
    forms[:total_unprocessed] = (Form.find_all_by_processed(false)).length
    forms[:total_form] = (Form.all).length
    forms[:total_processed_user] = (@user.forms.select{ |f| f.processed == true }).length
    forms[:total_unprocessed_user] = (@user.forms.select{ |f| f.processed == false }).length
    return forms
  end

end
