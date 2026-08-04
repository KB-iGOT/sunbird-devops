package tests

# The tokens used in test cases expire on 1640236102
# So we set the current_time to a few minutes earlier than the expiry
# This will ensure the test cases succeed

current_time := 1640235102
iss := "https://sunbirded.org/auth/realms/sunbird"
private_ingressgateway_ip := "1.2.3.4"

test_rc_certificate_create_internal_request {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with data.common.private_ingressgateway_ip as private_ingressgateway_ip
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {},
            "path": "/api/v1/TrainingCertificate",
            "method": "POST",
            "host": "1.2.3.4"
          }
        }
      },
      "parsed_body": {
        "recipient": {
          "id": "c4cc494f-04c3-49f3-b3d5-7b1a1984abad",
          "name": "Demo User",
          "type": "user"
        },
        "training": {
          "id": "do_1133327",
          "type": "Course",
          "name": "Dummy testing course",
          "batchId": "0134949"
        },
        "templateUrl": "https://sunbirddev.blob.core.windows.net/sunbird-content-dev/content/do_1131445945205145601809/artifact/template-2.svg",
        "issuer": {
          "name": "Gujarat Council of Educational Research and Training",
          "url": "http://gcert.gujarat.gov.in",
          "kid": "1-c539265f-a807-42cf-b4b3-d2706bbe7af8"
        },
        "signatory": [
          {
            "identity": "ASD",
            "designation": "CEO",
            "image": "data:image",
            "name": "CEO"
          },
          {
            "identity": "MD",
            "designation": "MD",
            "image": "data:image",
            "name": "MD"
          }
        ],
        "certificateLabel": "Completion Certificate",
        "status": "REVOKED"
      }
    }
}

test_rc_certificate_delete_internal_request {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with data.common.private_ingressgateway_ip as private_ingressgateway_ip
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {},
            "path": "/api/v1/TrainingCertificate/1-2427122e-060f-4595-bdc3-9c647630c133",
            "method": "DELETE",
            "host": "1.2.3.4"
          }
        }
      }
    }
}

test_rc_certificate_download_accept_as_json_no_xauth_token {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "accept": "application/json"
            },
            "path": "/api/v1/TrainingCertificate/1-2427122e-060f-4595-bdc3-9c647630c133",
            "method": "GET"
          }
        }
      }
    }
}

test_rc_certificate_download_accept_as_json_ld_no_xauth_token {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "accept": "application/vc+ld+json"
            },
            "path": "/api/v1/TrainingCertificate/1-2427122e-060f-4595-bdc3-9c647630c133",
            "method": "GET"
          }
        }
      }
    }
}

test_rc_certificate_download_accept_as_svg {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "accept": "image/svg+xml",
              "x-authenticated-user-token": "<x-authenticated-user-token>"
            },
            "path": "/api/v1/TrainingCertificate/1-2427122e-060f-4595-bdc3-9c647630c133",
            "method": "GET"
          }
        }
      }
    }
}

test_rc_certificate_search_mobile_payload {
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
            "path": "/api/v1/TrainingCertificate/search",
            "method": "POST"
          }
        }
      },
      "parsed_body": {
        "filters": {
          "recipient.id": {
            "eq": "28b0d08f-c2ea-40d1-bcd0-8ae00fca66be"
          }
        }
      }
    }
}

test_rc_certificate_search_portal_payload {
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
            "path": "/api/v1/TrainingCertificate/search",
            "method": "POST"
          }
        }
      },
      "parsed_body": {
        "filters": {
          "recipient": {
            "id": {
              "eq": "28b0d08f-c2ea-40d1-bcd0-8ae00fca66be"
            }
          }
        }
      }
    }
}

test_rc_certificate_search_public_key {
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
            "path": "/api/v1/PublicKey/search",
            "method": "POST"
          }
        }
      },
      "parsed_body": {
        "filter": {}
      }
    }
}

test_rc_certificate_get_public_key {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "path": "/api/v1/PublicKey/search/1-ab8bb63e-d4f2-11ec-9a7d-07cc64ac49c1",
            "method": "GET"
          }
        }
      }
    }
}