resource "docker_container" "php-httpd" {
  name  = "webserver"
  image = docker_image.php-httpd-image.name
  hostname = "php-httpd"

  labels {
    label = "challenge"
    value = "second"
  }

  networks_advanced {
    name = docker_network.private_network.name
  }

 ports {
    internal = 80
    external = 80
    ip = "0.0.0.0"
 }

   volumes {
    host_path      = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    container_path = "/var/www/html"
  }

}
