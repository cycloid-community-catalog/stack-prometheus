#
# Policies
#

# Assume
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# ec2 tag list policy
data "aws_iam_policy_document" "ec2-prometheus-sd" {
  statement {
    actions = [
      "ec2:DescribeTags",
      "ec2:DescribeInstances"
    ]

    effect    = "Allow"
    resources = ["*"]
  }
}
resource "aws_iam_policy" "ec2-prometheus-sd" {
  name        = "${var.env}-${var.project}-ec2-prometheus-sd"
  path        = "/"
  description = "EC2 Prometheus service discovery"
  policy      = "${data.aws_iam_policy_document.ec2-prometheus-sd.json}"
}


#
# Profile
#

# Create IAM Role for prometheus
resource "aws_iam_role" "prometheus" {
  name = "engine-cycloid-prometheus-${var.project}-${var.env}"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role.json}"
  path               = "/${var.project}/"
}

# Create instance profile
resource "aws_iam_instance_profile" "prometheus" {
  name = "engine-cycloid-prometheus-${var.project}-${var.env}"
  role = "${aws_iam_role.prometheus.name}"
}


#
# Policy attachment
#

resource "aws_iam_policy_attachment" "ec2-prometheus-sd" {
  name       = "${var.env}-${var.project}-ec2-prometheus-sd"
  roles      = ["${aws_iam_role.prometheus.name}"]
  policy_arn = "${aws_iam_policy.ec2-prometheus-sd.arn}"
}
