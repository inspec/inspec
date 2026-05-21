# Test PKI Fixtures — Intentional Private Key Note

The files in this directory include a committed RSA private key:

| File | Purpose |
|------|---------|
| `test_certificate.rsa.key.pem` | **Test-only** RSA 2048 private key |
| `test_certificate.rsa.crt.pem` | Matching self-signed test certificate |
| `test_ca_public.key.pem` | Test CA public key (no private material) |

## Why is a private key committed here?

These files are **deliberately committed** fixture data for the
`x509_certificate` and `key_rsa` InSpec resources. They are:

- **Self-signed** — issued by `CN=Inspec Test CA / O=Chef Software Inc`
- **Expired** — `notAfter=Mar 1 01:28:57 2018 GMT` (over 7 years ago)
- **Never used to sign anything real** — subject is `CN=Inspec Test Certificate`
- **Checked into the repo intentionally** since the initial resource commit (2017)

They pose **zero real-world risk**. The `.gitignore` contains explicit negation
rules (`!test/fixtures/files/*.pem`) to allow only these known test files
while blocking accidental commits of real keys elsewhere in the tree.

## If you need to regenerate these fixtures

```bash
# Generate new self-signed test CA + cert (test use only)
openssl genrsa -out test_certificate.rsa.key.pem 2048
openssl req -new -x509 -key test_certificate.rsa.key.pem \
  -out test_certificate.rsa.crt.pem -days 365 \
  -subj "/CN=Inspec Test Certificate/O=Chef Software Inc/OU=Inspec Testers/ST=WA/C=US/L=Seattle/emailAddress=support@chef.io"
openssl rsa -in test_certificate.rsa.key.pem -pubout -out test_ca_public.key.pem
```

Then update the expected public key value in:
- `test/unit/resources/key_rsa_test.rb`
- `test/unit/resources/x509_certificate_test.rb`

## Do NOT commit real keys

If you accidentally stage a real credential file, remove it immediately:

```bash
git reset HEAD <file>          # unstage
git rm --cached <file>         # remove from index if already added
echo "<file>" >> .gitignore    # prevent recurrence
```

If a real key was already pushed, treat it as compromised and rotate it immediately.
