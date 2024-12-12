class PgDockerHelper < Formula
  desc "A collection of scripts to help import and export Postgres databases from Docker containers. Primarily used for development and testing migrations."
  homepage "https://github.com/GoodPie/export-pg-db-docker"
  url "https://github.com/GoodPie/export-pg-db-docker/releases/tag/v1.0.0.0"
  version "1.0.0"

  resource "import-pg-db-docker" do
    url "https://raw.githubusercontent.com/GoodPie/export-pg-db-docker/refs/tags/v1.0.0.0/import-pg-db-docker.sh"
    sha256 "5f9803d538c82bdb69e8cab0b5eb0cf979f7499fe82b07b94eda28f197b98f3f"
  end

  resource "export-pg-db-docker" do
    url "https://raw.githubusercontent.com/GoodPie/export-pg-db-docker/3a0b96c6794fd20083b5a815cb8fbecacd9552a7/export-pg-db-docker.sh"
    sha256 "e907933ac1ae57d1e588fa33f6c96f14a78491600d912ec54f6d5043386d38e2"
  end

  def install
    resource("import-pg-db-docker").stage do
      bin.install "import-pg-db-docker.sh" => "import-pg-db-docker"
    end

    resource("export-pg-db-docker").stage do
      bin.install "export-pg-db-docker.sh" => "export-pg-db-docker"
    end
  end
end