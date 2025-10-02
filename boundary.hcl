disable_mlock = true

listener "tcp" {
  address     = "0.0.0.0:9200"
  purpose     = "api"
  tls_disable = true
}

listener "tcp" {
  address     = "0.0.0.0:9201"
  purpose     = "cluster"
  tls_disable = true
}

# 데이터 저장소 (파일 기반)
storage "file" {
  path = "/var/lib/boundary/data"
}

# Controller + Worker 모두 실행
controller {
  name = "demo-controller"
  description = "Boundary Controller"
  database {
    url = "file:///var/lib/boundary/data/boundary.db"
  }
}

worker {
  name = "demo-worker"
  description = "Boundary Worker"
  controllers = ["127.0.0.1:9201"]
}
