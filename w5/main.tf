terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = ""
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

resource "local_file" "Max" {
  filename = "Max.txt"
  content  = random_password.Maxpass.result
  
  
}
resource "random_password" "Maxpass" {
    length = 8
    upper =  false
    numeric = false
    special = false
  
}