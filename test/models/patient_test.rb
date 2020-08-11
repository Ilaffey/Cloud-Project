require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

test 'valid patient' do
    patient = Pateint.new(name: 'Jeff hardy', contactNumber: 04312344, address: 'North Carolina', gender: 'Male', dob: '1991-12-17 00:00:00', ppsNumber: '123445678P')
    assert patient.valid?
end

test 'invalid without name' do
    patient = Patient.new(contactNumber: 04312344, address: 'North Carolina', gender: 'Male', dob: '1991-12-17 00:00:00', ppsNumber: '123445678P')
    assert_not patient.valid?
  end

test 'invalid without address' do
    patient = Patient.new(name: 'Jeff hardy', contactNumber: 04312344, gender: 'Male', dob: '1991-12-17 00:00:00', ppsNumber: '123445678P')
    assert_not patient.valid?
  end

test 'address is invalid when address has more than 200 chars' do
    max_chars = 200
    description = ""

    for i in 1..max_chars + 1 do
      address += i.to_s
    end

assert address.length > max_chars

    patient = Patient.new(name: 'Jeff hardy', contactNumber: 04312344, address: address, gender: 'Male', dob: '1991-12-17 00:00:00', ppsNumber: '123445678P')

    assert_not patient.valid?
  end

test 'contact number must be integer' do
    patient = Patient.new(name: 'Jeff hardy', contactNumber: 04312344, address: 'North Carolina', gender: 'Male', dob: '1991-12-17 00:00:00', ppsNumber: '123445678P')

    assert_not patient.valid?

    patient[:contactNumber] = true

    assert_not patient.valid?

    patient[:contactNumber] = 04312344

    assert patient.valid?
  end

end

