resource "docker_container" "phpmyadmin" {
  name     = "db_dashboard"
  image    = "phpmyadmin/phpmyadmin"
  hostname = "phpmyadmin"

  labels {
    label = "challenge"
    value = "second"
  }

  networks_advanced {
    name = docker_network.private_network.name
  }

  ports {
    internal = 80
    external = 8081
    ip       = "0.0.0.0"
  }

  volumes {
    host_path      = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    container_path = "/var/www/html"
  }


  links = [
    docker_container.mariadb.name
  ]

  depends_on = [
    docker_container.mariadb
  ]

}
