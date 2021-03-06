class Form < ActiveRecord::Base
  attr_accessible :additional_info, :cancer_care_provider, :chemo, :consent, :date, :date_of_birth, :first_name, :income, :last_name, :late_stage, :middle_initial, :phone_number, :preferred_language, :radiation, :service_area, :signature, :surgery, :medical_facility, :processed, :user_id, :processed_by, :processed_date
  belongs_to :user
  validate :required_fields

  def required_fields
      errors.add(:base, "Consent needs to be given") unless self.consent
      errors.add(:base, "Need a number") unless self.phone_number
  end

  def process(by_name)
      self.processed = true
      self.processed_by = by_name
      self.save!
  end

  # Send reset email
  def send_email_confirmation(user)
      UserMailer.email_confirmation(user, self).deliver
  end

end
