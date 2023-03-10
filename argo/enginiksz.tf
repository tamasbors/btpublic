resource "kubernetes_pod" "nginx" {
  metadata {
    name = "nginx"
  }

  spec {
    container {
      image = "nginx:latest"
      name  = "nginx"
      port {
        container_port = 80
      }
    }
  }
}
