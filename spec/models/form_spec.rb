require 'spec_helper'

describe Form do

  before :each do
    @form = Form.new
    @form.processed = false
  end

  it 'should process forms' do
    expect(@form.processed).to eq(false)
    @form.process
    expect(@form.processed).to eq(true)
  end

end