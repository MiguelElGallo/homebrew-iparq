class Iparq < Formula
    include Language::Python::Virtualenv
    desc "Display version and compression of a Parquet File"
    homepage "https://github.com/MiguelElGallo/iparq"
    url "https://files.pythonhosted.org/packages/db/c4/d5806c9a31f3d7f54618878876b7f167a2e7215183154d627f1777d6dece/iparq-0.3.0.tar.gz"
    sha256 "07d443d7fd22da6fc0d7d7bd800fd2ef9935d737635c70fb3084b7a906e8f417"
    license "MIT"
  
    depends_on "cmake" => :build
    depends_on "ninja" => :build
    depends_on "rust" => :build # for pydantic-core
    depends_on "apache-arrow"
    depends_on "libpq" # psycopg
    depends_on "python@3.11"
  
    on_linux do
      depends_on "patchelf" => :build # for pyarrow
    end
  
    resource "pyarrow" do
      url "https://files.pythonhosted.org/packages/a2/ee/a7810cb9f3d6e9238e61d312076a9859bf3668fd21c69744de9532383912/pyarrow-20.0.0.tar.gz"
      sha256 "febc4a913592573c8d5805091a6c2b5064c8bd6e002131f01061797d91c783c1"
    end
  
    resource "annotated-types" do
      url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
      sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
    end
  
    resource "click" do
      url "https://files.pythonhosted.org/packages/60/6c/8ca2efa64cf75a977a0d7fac081354553ebe483345c734fb6b6515d96bbc/click-8.2.1.tar.gz"
      sha256 "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
    end
  
    resource "colorama" do
      url "https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4/colorama-0.4.6.tar.gz"
      sha256 "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
    end
  
    resource "exceptiongroup" do
      url "https://files.pythonhosted.org/packages/0b/9f/a65090624ecf468cdca03533906e7c69ed7588582240cfe7cc9e770b50eb/exceptiongroup-1.3.0.tar.gz"
      sha256 "b241f5885f560bc56a59ee63ca4c6a8bfa46ae4ad651af316d4e81817bb9fd88"
    end
  
    resource "iniconfig" do
      url "https://files.pythonhosted.org/packages/f2/97/ebf4da567aa6827c909642694d71c9fcf53e5b504f2d96afea02718862f3/iniconfig-2.1.0.tar.gz"
      sha256 "3abbd2e30b36733fee78f9c7f7308f2d0050e88f0087fd25c2645f63c773e1c7"
    end
  
    resource "markdown-it-py" do
      url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0/markdown-it-py-3.0.0.tar.gz"
      sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
    end
  
    resource "mdurl" do
      url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
      sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
    end
  
    resource "packaging" do
      url "https://files.pythonhosted.org/packages/a1/d4/1fc4078c65507b51b96ca8f8c3ba19e6a61c8253c72794544580a7b6c24d/packaging-25.0.tar.gz"
      sha256 "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
    end
  
    resource "pluggy" do
      url "https://files.pythonhosted.org/packages/f9/e2/3e91f31a7d2b083fe6ef3fa267035b518369d9511ffab804f839851d2779/pluggy-1.6.0.tar.gz"
      sha256 "7dcc130b76258d33b90f61b658791dede3486c3e6bfb003ee5c9bfb396dd22f3"
    end
  
    resource "pydantic" do
      url "https://files.pythonhosted.org/packages/f0/86/8ce9040065e8f924d642c58e4a344e33163a07f6b57f836d0d734e0ad3fb/pydantic-2.11.5.tar.gz"
      sha256 "7f853db3d0ce78ce8bbb148c401c2cdd6431b3473c0cdff2755c7690952a7b7a"
    end
  
    resource "pydantic-core" do
      url "https://files.pythonhosted.org/packages/42/fa/5f682f3db14e14f7b5b7f5008ac24594b93943d1da4facbacff5876624cf/pydantic_core-2.34.1.tar.gz"
      sha256 "6bf31628ab6d0e7c7c0372419898c52ef0a447b33ab47c7f62053bd013cc5b09"
    end
  
    resource "pygments" do
      url "https://files.pythonhosted.org/packages/7c/2d/c3338d48ea6cc0feb8446d8e6937e1408088a72a39937982cc6111d17f84/pygments-2.19.1.tar.gz"
      sha256 "61c16d2a8576dc0649d9f39e089b5f02bcd27fba10d8fb4dcc28173f7a45151f"
    end
  
    resource "pytest" do
      url "https://files.pythonhosted.org/packages/fb/aa/405082ce2749be5398045152251ac69c0f3578c7077efc53431303af97ce/pytest-8.4.0.tar.gz"
      sha256 "14d920b48472ea0dbf68e45b96cd1ffda4705f33307dcc86c676c1b5104838a6"
    end
  
    resource "rich" do
      url "https://files.pythonhosted.org/packages/a1/53/830aa4c3066a8ab0ae9a9955976fb770fe9c6102117c8ec4ab3ea62d89e8/rich-14.0.0.tar.gz"
      sha256 "82f1bc23a6a21ebca4ae0c45af9bdbc492ed20231dcb63f297d6d1021a9d5725"
    end
  
    resource "shellingham" do
      url "https://files.pythonhosted.org/packages/58/15/8b3609fd3830ef7b27b655beb4b4e9c62313a4e8da8c676e142cc210d58e/shellingham-1.5.4.tar.gz"
      sha256 "8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de"
    end
  
    resource "tomli" do
      url "https://files.pythonhosted.org/packages/18/87/302344fed471e44a87289cf4967697d07e532f2421fdaf868a303cbae4ff/tomli-2.2.1.tar.gz"
      sha256 "cd45e1dc79c835ce60f7404ec8119f2eb06d38b1deba146f07ced3bbc44505ff"
    end
  
    resource "typer" do
      url "https://files.pythonhosted.org/packages/c5/8c/7d682431efca5fd290017663ea4588bf6f2c6aad085c7f108c5dbc316e70/typer-0.16.0.tar.gz"
      sha256 "af377ffaee1dbe37ae9440cb4e8f11686ea5ce4e9bae01b84ae7c63b87f1dd3b"
    end
  
    resource "typing-extensions" do
      url "https://files.pythonhosted.org/packages/d1/bc/51647cd02527e87d05cb083ccc402f93e441606ff1f01739a62c8ad09ba5/typing_extensions-4.14.0.tar.gz"
      sha256 "8676b788e32f02ab42d9e7c61324048ae4c6d844a399eebace3d4979d75ceef4"
    end
  
    def install
      virtualenv_install_with_resources
    end
  
    test do
      system "#{bin}/iparq", "--help"
    end
  end
  