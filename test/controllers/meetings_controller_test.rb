# frozen_string_literal: true

require 'test_helper'

class MeetingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meeting = meetings(:one)
  end

  test 'should get index' do
    get meetings_url, as: :json
    assert_response :success
  end

  test 'should create meeting' do
    assert_difference('Meeting.count') do
      post meetings_url,
           params: { meeting: { book_full_day: @meeting.book_full_day, end_date: @meeting.end_date, end_time: @meeting.end_time, start_date: @meeting.start_date, start_time: @meeting.start_time } }, as: :json
    end

    assert_response :created
  end

  test 'should show meeting' do
    get meeting_url(@meeting), as: :json
    assert_response :success
  end

  test 'should update meeting' do
    patch meeting_url(@meeting),
          params: { meeting: { book_full_day: @meeting.book_full_day, end_date: @meeting.end_date, end_time: @meeting.end_time, start_date: @meeting.start_date, start_time: @meeting.start_time } }, as: :json
    assert_response :success
  end

  test 'should destroy meeting' do
    assert_difference('Meeting.count', -1) do
      delete meeting_url(@meeting), as: :json
    end

    assert_response :no_content
  end
end
