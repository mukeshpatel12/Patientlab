require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  test "validates id_number" do
    patient = patients(:one)
    patient.id_number = ""

    refute patient.valid?
    assert patient.errors[:id_number].present?
  end
end
