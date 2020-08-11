require 'test_helper'

class DoctorprofileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

test 'valid doctor' do
    doctorprofile = Doctorprofile.new(name: 'Undertaker', contactNumber: 04312344, address: 'Houston Texas')
    assert doctorprofile.valid?
end

test 'invalid without name' do
    doctorprofile = Doctorprofile.new(contactNumber: 04312344, address: 'Houston Texas')
    assert_not doctorprofile.valid?
  end

test 'invalid without address' do
    doctorprofile = Doctorprofile.new(name: 'Undertaker', contactNumber: 04312344)
    assert_not doctorprofile.valid?
  end

test 'address is invalid when address has more than 200 chars' do
    max_chars = 200
    description = ""

    for i in 1..max_chars + 1 do
      address += i.to_s
    end

assert address.length > max_chars

    doctorprofile = Doctorprofile.new(name: 'Undertaker', contactNumber: 04312344, address: address)

    assert_not doctorprofile.valid?
  end

test 'contact number must be integer' do
    doctorprofile = Doctorprofile.new(name: 'Undertaker', contactNumber: 04312344, address: 'Houston Texas')

    assert_not doctorprofile.valid?

    doctorprofile[:contactNumber] = true

    assert_not doctorprofile.valid?

    doctorprofile[:contactNumber] = 04312344

    assert doctorprofile.valid?
  end

end

