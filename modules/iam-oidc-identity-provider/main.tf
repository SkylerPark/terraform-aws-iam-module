data "tls_certificate" "this" {
  count = var.auto_thumbprint_enabled ? 1 : 0

  url = var.url
}

resource "aws_iam_openid_connect_provider" "this" {
  url = var.url

  client_id_list = var.audiences
  thumbprint_list = setunion(
    var.thumbprints,
    (var.auto_thumbprint_enabled
      ? data.tls_certificate.this[*].certificates[0].sha1_fingerprint
      : []
    )
  )

  tags = merge(
    {
      "Name" = trimprefix(var.url, "https://")
    },
    var.tags,
  )
}
