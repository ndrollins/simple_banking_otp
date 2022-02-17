defmodule TheOtpTest do
  use ExUnit.Case
  doctest TheOtp

  test "greets the world" do
    assert TheOtp.hello() == :world
  end
end
