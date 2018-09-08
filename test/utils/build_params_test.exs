defmodule Shopiex.BuildParamsTest do
  use ExUnit.Case, async: true
  import Shopiex.BuildParams

  describe "BuildParams.build_and_join" do
    test "limit: 10_000" do
      options = [
        limit: 10_000
      ]

      assert(build_and_join(options) == "limit=10000")
    end

    test "limit: 10_000, highfive: true" do
      options = [
        limit: 10_000,
        highfive: true
      ]

      assert(build_and_join(options) == "limit=10000&highfive=true")
    end

    test "limit: 10_000, highfive: true, namespace: `sample`" do
      options = [
        limit: 10_000,
        highfive: true,
        namespace: "sample"
      ]

      assert(build_and_join(options) == "limit=10000&highfive=true&namespace=sample")
    end

    test "use list in option: namespace" do
      options = [
        namespace: ["sample", "asdf", "qwert"]
      ]

      assert(build_and_join(options) == "namespace=sample,asdf,qwert")
    end
  end

end
