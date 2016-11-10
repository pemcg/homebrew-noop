require 'formula'

# Main class describing formula
class YumMetadataParser < Formula
  homepage 'http://yum.baseurl.org/'
  url 'http://yum.baseurl.org/download/yum-metadata-parser/yum-metadata-parser-1.1.4.tar.gz'

  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'sqlite3'
  depends_on :python

  def install
    # Fix for removed python. stuff... Argh!
    pypref = `python-config --prefix`.chomp
    pybin = "#{pypref}/bin/python"

    system pybin, 'setup.py', 'build'
    system pybin, 'setup.py', 'install', "--prefix=#{prefix}"
  end
end
