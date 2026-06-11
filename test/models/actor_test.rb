require "test_helper"

class ActorTest < ActiveSupport::TestCase
  test "errors on non-existing fields" do
    actor = Actor.new

    assert actor.invalid?
    assert actor.errors[:name].any?
    assert actor.errors[:birth_date].any?
    assert actor.errors[:height].any?
    assert actor.errors[:gender].any?
  end

  test "errors on empty fields" do
    actor = Actor.new(
      name: "",
      birth_date: "",
      height: "",
      gender: ""
    )

    assert actor.invalid?
    assert actor.errors[:name].any?
    assert actor.errors[:birth_date].any?
    assert actor.errors[:height].any?
    assert actor.errors[:gender].any?
  end

  test "errors for incorrect fields" do
    actor = Actor.new(
      name: "Test Actor",
      birth_date: "2000-01-01",
      height: 10,
      weight: 10,
      gender: "man",
      blood_type: "C"
    )

    assert actor.invalid?
    assert actor.errors[:height].any?
    assert actor.errors[:weight].any?
    assert actor.errors[:gender].any?
    assert actor.errors[:blood_type].any?
  end

  test "errors for too large numbers" do
    actor = Actor.new(
      name: "Test Actor",
      birth_date: "2000-01-01",
      height: 999,
      weight: 999,
      gender: "female",
      blood_type: "AB"
    )

    assert actor.invalid?
    assert actor.errors[:height].any?
    assert actor.errors[:weight].any?
  end

  test "no errors on correct fields" do
    actor = Actor.new(
      name: "Tom Cruise",
      birth_date: "1962-07-03",
      height: 170,
      weight: 70,
      gender: "male",
      blood_type: "A"
    )

    assert actor.valid?
    assert actor.errors[:name].none?
    assert actor.errors[:birth_date].none?
    assert actor.errors[:height].none?
    assert actor.errors[:weight].none?
    assert actor.errors[:gender].none?
    assert actor.errors[:blood_type].none?
  end

  test "no errors with blank optional fields" do
    actor = Actor.new(
      name: "Test Actor",
      birth_date: "2000-01-01",
      height: 170,
      weight: "",
      gender: "female",
      blood_type: ""
    )

    assert actor.valid?
    assert actor.errors[:weight].none?
    assert actor.errors[:blood_type].none?
  end
end
