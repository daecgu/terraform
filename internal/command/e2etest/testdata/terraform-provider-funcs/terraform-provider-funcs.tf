# This test fixture is here primarily just to make sure that the
# terraform.io/builtin/terraform functions remain available for use. The
# actual behavior of these functions is the responsibility of
# ./internal/builtin/providers/terraform, and so it has more detailed tests
# whereas this one is focused largely just on whether these functions are
# callable at all.

terraform {
  required_providers {
    terraform = {
      source = "terraform.io/builtin/terraform"
    }
  }
}

output "tfvarsencode" {
  value = provider::terraform::tfvarsencode({
    a = "👋"
    b = "🐝"
    c = "👓"
  })
}

output "tfvarsdecode" {
  value = provider::terraform::tfvarsdecode(
    <<-EOT
      boop = "👃"
      baaa = "🐑"
    EOT
  )
}

output "exprencode" {
  value = provider::terraform::exprencode([1, 2, 3])
}
