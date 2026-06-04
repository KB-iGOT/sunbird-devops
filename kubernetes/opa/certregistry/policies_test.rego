package tests

# The tokens used in test cases expire on 1640236102
# So we set the current_time to a few minutes earlier than the expiry
# This will ensure the test cases succeed

current_time := 1640235102
iss := "https://sunbirded.org/auth/realms/sunbird"

test_download_reg_certificate_v1 {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "x-authenticated-user-token": "<x-authenticated-user-token>"
            },
            "path": "/certs/v1/registry/download"
          }
        }
      }
    }
}

test_download_reg_certificate_v2 {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "x-authenticated-user-token": "<x-authenticated-user-token>"
            },
            "path": "/certs/v2/registry/download"
          }
        }
      }
    }
}

test_search_reg_certificate {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "x-authenticated-user-token": "<x-authenticated-user-token>"
            },
            "path": "/certs/v1/registry/search"
          }
        }
      },
      "parsed_body": {
        "request": {
          "_source": [
            "data.badge.issuer.name",
            "pdfUrl",
            "data.issuedOn",
            "data.badge.name"
          ],
          "query": {
            "bool": {
              "must": [
                {
                  "match_phrase": {
                    "recipient.id": "28b0d08f-c2ea-40d1-bcd0-8ae00fca66be"
                  }
                }
              ]
            }
          }
        }
      }
    }
}