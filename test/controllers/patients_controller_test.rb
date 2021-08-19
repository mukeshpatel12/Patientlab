require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest
  test "get index" do
    get patients_path

    assert_response :success
  end

  test "post create with response first" do
    post patients_path(case1: "case1")

    assert_equal true, Patient.last.patient_name.present?
    assert_equal true, Patient.last.id_number.present?
    assert_equal false, Patient.last.first_name.present?
    assert_equal true, Patient.last.patient_labs.present?
  end

  test "post create with response second" do
    post patients_path(case2: "case2")

    assert_equal false, Patient.last.patient_name.present?
    assert_equal true, Patient.last.id_number.present?
    assert_equal true, Patient.last.first_name.present?
    assert_equal true, Patient.last.last_name.present?
    assert_equal true, Patient.last.patient_labs.present?
  end
end
