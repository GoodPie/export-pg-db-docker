class PgDockerHelper < Formula
  desc "A collection of scripts to help import and export Postgres databases from Docker containers. Primarily used for development and testing migrations."
  homepage "https://github.com/GoodPie/export-pg-db-docker"
  version "1.0.0"

  resource "import-pg-db-docker" do
    url "https://raw.githubusercontent.com/GoodPie/export-pg-db-docker/1.0.0/import-pg-db-docker.sh"
    sha256 ""
  end

  resource "export-pg-db-docker" do
    url "https://raw.githubusercontent.com/GoodPie/export-pg-db-docker/1.0.0/export-pg-db-docker.sh"
    sha256 ""
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