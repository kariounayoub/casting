require 'test_helper'

class InscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inscription = inscriptions(:one)
  end

  test "should get index" do
    get inscriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_inscription_url
    assert_response :success
  end

  test "should create inscription" do
    assert_difference('Inscription.count') do
      post inscriptions_url, params: { inscription: { evenement_id: @inscription.evenement_id, q1: @inscription.q1, q10: @inscription.q10, q2: @inscription.q2, q3: @inscription.q3, q4: @inscription.q4, q5: @inscription.q5, q6: @inscription.q6, q7: @inscription.q7, q8: @inscription.q8, q9: @inscription.q9, r1: @inscription.r1, r10: @inscription.r10, r2: @inscription.r2, r3: @inscription.r3, r4: @inscription.r4, r5: @inscription.r5, r6: @inscription.r6, r7: @inscription.r7, r8: @inscription.r8, r9: @inscription.r9, user_id: @inscription.user_id } }
    end

    assert_redirected_to inscription_url(Inscription.last)
  end

  test "should show inscription" do
    get inscription_url(@inscription)
    assert_response :success
  end

  test "should get edit" do
    get edit_inscription_url(@inscription)
    assert_response :success
  end

  test "should update inscription" do
    patch inscription_url(@inscription), params: { inscription: { evenement_id: @inscription.evenement_id, q1: @inscription.q1, q10: @inscription.q10, q2: @inscription.q2, q3: @inscription.q3, q4: @inscription.q4, q5: @inscription.q5, q6: @inscription.q6, q7: @inscription.q7, q8: @inscription.q8, q9: @inscription.q9, r1: @inscription.r1, r10: @inscription.r10, r2: @inscription.r2, r3: @inscription.r3, r4: @inscription.r4, r5: @inscription.r5, r6: @inscription.r6, r7: @inscription.r7, r8: @inscription.r8, r9: @inscription.r9, user_id: @inscription.user_id } }
    assert_redirected_to inscription_url(@inscription)
  end

  test "should destroy inscription" do
    assert_difference('Inscription.count', -1) do
      delete inscription_url(@inscription)
    end

    assert_redirected_to inscriptions_url
  end
end
