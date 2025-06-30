provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "myapp" {
  metadata {
    name = "myapp-deployment"
    labels = {
      app = "myapp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "myapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "myapp"
        }
      }

      spec {
        container {
          name  = "myapp-container"
          image = "navneet78/myapp_terrakube:v1"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "myapp" {
  metadata {
    name = "myapp-service"
  }

  spec {
    selector = {
      app = "myapp"
    }

    port {
      port        = 80
      target_port = 80
      node_port   = 30080
    }

    type = "NodePort"
  }
}
