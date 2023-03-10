resource "kubernetes_pod" "nginx" {
  metadata {
    name = "nginxooooooooooooooooo"
  }

  spec {
    container {
      image = "nginx:latest"
      name  = "ngisadasdasdanx"
      port {
        container_port = 80
      }
    }
  }
}
