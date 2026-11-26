class Iparq < Formula
  include Language::Python::Virtualenv

  desc "Inspect Parquet and Vortex storage metadata"
  homepage "https://iparq.dev/"
  url "https://files.pythonhosted.org/packages/a5/d5/4bb8011ac853c828ea2d04ae61956f4e498a183138fd67e21991caa14d46/iparq-0.8.2.tar.gz"
  sha256 "5ea9e6d80fcffa06d5a714b3fdd40c605187c933f8add1fde69b4334034e1826"
  license "MIT"

  depends_on "cmake" => :build # for pyarrow
  depends_on "ninja" => :build # for pyarrow
  depends_on "rust" => :build # for pydantic-core
  depends_on "apache-arrow"
  depends_on "python@3.14"

  on_macos do
    on_arm do
      resource "vortex-data" do
        url "https://files.pythonhosted.org/packages/00/9c/540d030d7834061d369f0ab9a84c536266ba7562d789c3fb3852085159a1/vortex_data-0.95.0-cp311-abi3-macosx_11_0_arm64.whl", using: :nounzip
        sha256 "a0df1e85c4d044c993ce90bea2c32a74e3c1a115a3015b54a45d192eb91142b7"
      end
    end

    on_intel do
      resource "vortex-data" do
        url "https://files.pythonhosted.org/packages/50/e8/39b8279c3ef5a930bb34c84fedd21a8d7eb57eef472f5d1caaecd7b4a31b/vortex_data-0.95.0-cp311-abi3-macosx_10_12_x86_64.whl", using: :nounzip
        sha256 "73d070c4d60e8edd48274faf1c569926cf182f4e164828ec835bb3b8539716d6"
      end
    end
  end

  on_linux do
    depends_on "patchelf" => :build # for pyarrow

    on_arm do
      resource "vortex-data" do
        url "https://files.pythonhosted.org/packages/75/d6/fd0ca9a5b05a3fee418734e7d5df807949375b5a8ece5cda337e0f6945e8/vortex_data-0.95.0-cp311-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.whl", using: :nounzip
        sha256 "b9919ecc460a253a0218ffdbb026f28ae5db7f15beb15f50083feba888b2d223"
      end
    end

    on_intel do
      resource "vortex-data" do
        url "https://files.pythonhosted.org/packages/9b/ee/f3b8ae56d84b685b564622712f8756b2ecd755c7040a3e2d02da4f4df1fb/vortex_data-0.95.0-cp311-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.whl", using: :nounzip
        sha256 "2576064f338b274a1214775a1e3c8808482f663d247f1b2046f3c4453fe1f335"
      end
    end
  end

  resource "annotated-doc" do
    url "https://files.pythonhosted.org/packages/0b/7d/bdbf3062e5dae31da8b3de1e3269110beb93d268df4a7f6d22b167c6cee0/annotated_doc-0.0.7.tar.gz"
    sha256 "0a30ef8f5322a4173720ae6712dc9a5e58f5a19868f3f167b4b5778db066c2b5"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/5f/56/a8120250d128bed162cd73c76d45f6ef9991f3e068f62a8ee060afa3104a/annotated_types-0.8.0.tar.gz"
    sha256 "13b2beaad985e05e2d6407ee4c4f35590b11f8d693a258a561055cac8f64cab7"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/16/fc/cee2c45553c9a9bf77d8b0c391560c556d7ed756b1f0bb35eb5d48db09ea/markdown_it_py-4.3.0.tar.gz"
    sha256 "91a58fa5b72c71a40cf7177250fd767480d7a2bb3ac426ccfb76fb90305fdaaa"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/66/70/e908e9c5e52ef7c3a6c7902c9dfbb34c7e29c25d2f81ade3856445fd5c94/protobuf-6.33.6.tar.gz"
    sha256 "a6768d25248312c297558af96a9f9c929e8c4cee0659cb07e780731095f38135"
  end

  resource "pyarrow" do
    url "https://files.pythonhosted.org/packages/bc/5e/9cb2a56d5e293aab4e2fbecc5b0620d93227d66b8d5a63c554c31e1f80fe/pyarrow-26.0.1.tar.gz"
    sha256 "93affcbd8a343e98dc19e9ec8fe17271ebf8fe98102d8b7454175074409f8b72"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/8e/25/3ec212432a6031b65f043eaca9c820ddf87c0d0aa330023e64f79fcb5db6/pydantic-2.14.4.tar.gz"
    sha256 "7c19f1d46f8accf55a4617a6116e1ade64840870f397b846a2c53fb9019414ba"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/fb/63/0ceb815a7762576027ce388544c573d440574f95afb1302a2496b96db548/pydantic_core-2.50.5.tar.gz"
    sha256 "1e740886083ff95530d694e6a3f09ed914bcf92a496d16acd307c6c3484fc36d"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/58/15/8b3609fd3830ef7b27b655beb4b4e9c62313a4e8da8c676e142cc210d58e/shellingham-1.5.4.tar.gz"
    sha256 "8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de"
  end

  resource "substrait" do
    url "https://files.pythonhosted.org/packages/83/8b/00266dfda600802a45569b28c0f412001e6dc1bb9c264b5aefa77860adc0/substrait-0.28.0.tar.gz"
    sha256 "0d73925a7fefb0503637d3dad35e70e14e74b2a72fa624ab95514ed79a067cac"
  end

  resource "substrait-extensions" do
    url "https://files.pythonhosted.org/packages/ba/80/d8c822bc2a70026beb80eff121c2dd1160befa2622e4f0a766506b71bba2/substrait_extensions-0.79.0.tar.gz"
    sha256 "ae295944eb007d5d8243b4e9b818635ee054c6cab224b28e2d45746541b384f2"
  end

  resource "substrait-protobuf" do
    url "https://files.pythonhosted.org/packages/61/8d/0d7ff0e56fdf341182729da4ce5754712ad3b950e0e404ec2fa53f46627b/substrait_protobuf-0.79.0.tar.gz"
    sha256 "f1bf8641eb3ee785f4affd4f728568958deda2bb1ededa09f02f2118229616d4"
  end

  resource "typer" do
    url "https://files.pythonhosted.org/packages/f4/8f/4583099c74623e04610d9df01ff58a9217935e88fdbd4b14167ebe99c134/typer-0.29.3.tar.gz"
    sha256 "8189a53bb9684dc551e0b61e71904b323214884f2eb14bfe71aa859ae980d10a"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/ff/50/0195198eb1d75bab716bb0a813abea4cc394bfa17a92a189f021a34859af/typing_inspection-0.4.5.tar.gz"
    sha256 "7f16c411e7930dc79596d42ab44672a3fe5f60eb34b781a1647e7872363120c7"
  end

  def install
    venv = virtualenv_install_with_resources without: "vortex-data"
    resource("vortex-data").stage do
      venv.pip_install Pathname(Dir["*.whl"].fetch(0))
    end
  end

  test do
    assert_equal version.to_s, shell_output("#{libexec}/bin/python -c 'import iparq; print(iparq.__version__)'").chomp
    system libexec/"bin/python", "-c", <<~PYTHON
      import pyarrow as pa
      import pyarrow.parquet as pq
      import vortex as vx

      table = pa.table({"id": [1, 2]})
      pq.write_table(table, "sample.parquet")
      vx.io.write(table, "sample.vortex")
    PYTHON
    files = JSON.parse(shell_output("#{bin}/iparq inspect sample.vortex sample.parquet --format json"))
    assert_equal "vortex", files.first.dig("metadata", "file_format")
    assert_equal [2, 2], files.map { |file| file.dig("metadata", "num_rows") }
  end
end
