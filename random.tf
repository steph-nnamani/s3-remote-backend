# The following example shows how to generate a random priority
# between 1 and 50000 for a aws_alb_listener_rule resource:

resource "random_integer" "backend" {
  min = 1
  max = 100
  keepers = {
    # Generate a new number when there is a change in the environment variable
    Environment = var.env
  }
}