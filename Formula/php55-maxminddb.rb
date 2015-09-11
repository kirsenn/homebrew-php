require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php55Maxminddb < AbstractPhp55Extension
  init
  desc "Extension for MaxMind DB file format"
  homepage "https://github.com/maxmind/libmaxminddb"
  url "https://github.com/maxmind/MaxMind-DB-Reader-php/archive/v1.0.3.tar.gz"
  sha256 "c027479441b17ed5928640d27c42bccbb35ca07ac6401423c5bbb7220f720638"

  bottle do
  end

  depends_on "libmaxminddb"

  def install
    Dir.chdir "ext"

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", "--with-maxminddb=#{Formula["libmaxminddb"].opt_prefix}", phpconfig
    system "make"
    prefix.install "modules/maxminddb.so"
    write_config_file if build.with? "config-file"
  end
end
