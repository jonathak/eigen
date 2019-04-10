defmodule EigenTest do
  use ExUnit.Case
  doctest Eigen
	doctest Eigen.Matrix
	doctest Eigen.Stuff

  test "greets the world" do
    assert Eigen.hello() == :world
  end
end
