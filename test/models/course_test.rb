require "test_helper"

class CourseTest < ActiveSupport::TestCase
  test "Not save course without coursename" do
    course = Course.new(subjectcode: "CS101")
    assert_not course.save, "Saved the course without a coursename"
  end

  test "Not save course without subjectcode" do
    course = Course.new(coursename: "Introduction to CS")
    assert_not course.save, "Saved the course without a subjectcode"
  end

  test "Save course with valid attributes" do
    course = Course.new(coursename: "Introduction to CS", subjectcode: "CS101")
    assert course.save, "Failed to save course with valid attributes"
  end

  test "Not allow duplicate coursename" do
    course1 = Course.create(coursename: "Data Structures", subjectcode: "CS102")
    assert course1.persisted?, "First course should be saved"

    course2 = Course.new(coursename: "Data Structures", subjectcode: "CS103")
    assert_not course2.save, "Saved a course with duplicate coursename"
  end

  test "Respond to enrollments and students association" do
    course = Course.new(coursename: "Test Course", subjectcode: "TC101")
    assert_respond_to course, :enrollments
    assert_respond_to course, :students
  end
end
