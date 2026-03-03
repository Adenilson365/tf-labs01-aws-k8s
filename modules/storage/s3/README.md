### allowing access

- IAM model with IAM policy
  > In this case, we create role and attach then to principal whose needs access the bucket

```JSON
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowListBucket",
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::meu-bucket-app"
    },
    {
      "Sid": "AllowObjectAccess",
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "arn:aws:s3:::meu-bucket-app/*"
    }
  ]
}

```

- ABAC Model with bucket policy
  > In this case we put permissions in bucket policy and it control access from the principal.

```JSON
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowAppRoleAccess",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:role/AppRole"
      },
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::meu-bucket-app"
    },
    {
      "Sid": "AllowAppRoleObjectAccess",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:role/AppRole"
      },
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "arn:aws:s3:::meu-bucket-app/*"
    }
  ]
}


```
