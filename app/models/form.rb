class Form < ActiveRecord::Base
  attr_accessible :additional_info, :cancer_care_provider, :chemo, :consent, :date, :date_of_birth, :first_name, :income, :last_name, :late_stage, :middle_initial, :phone_number, :preferred_language, :radiation, :service_area, :signature, :surgery, :medical_facility, :processed, :user_id, :process_by, :processed_date
  belongs_to :user  

  def process(by_name)
      self.processed = true
      self.processed_by = by_name
      self.save!
  end

end
