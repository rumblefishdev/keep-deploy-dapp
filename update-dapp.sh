aws s3 sync build s3://keep-test.rumblefish.dev --delete
aws cloudfront create-invalidation --paths "/*" --distribution-id E1UTAOSOAY99XS
