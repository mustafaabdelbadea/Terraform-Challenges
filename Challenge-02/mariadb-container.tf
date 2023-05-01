resource "docker_container" "mariadb" {
  name     = "db"
  image    = "mariadb:challenge"
  hostname = "db"

  labels {
    label = "challenge"
    value = "second"
  }

  networks_advanced {
    name = docker_network.private_network.name
  }

  env = [
    "MYSQL_ROOT_PASSWORD=1234",
    "MYSQL_DATABASE=simple-website"
  ]


  ports {
    internal = 3306
    external = 3306
    ip       = "0.0.0.0"
  }

  volumes {
    volume_name    = "mariadb-volume"
    container_path = "/var/lib/mysql"
  }
}
