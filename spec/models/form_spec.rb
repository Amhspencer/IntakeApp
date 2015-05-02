require 'spec_helper'

describe Form do

  before :each do
    @form = Form.new
    @form.consent = true
    @form.phone_number = 1234567890
    @form.processed = false
  end

  it 'should process forms' do
    expect(@form.processed).to eq(false)
    @form.process("Partner")
    expect(@form.processed).to eq(true)
    expect(@form.processed_by).to eq("Partner")
  end

end
