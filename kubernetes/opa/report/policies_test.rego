package tests

# The tokens used in test cases expire on 1640236102
# So we set the current_time to a few minutes earlier than the expiry
# This will ensure the test cases succeed

current_time := 1640235102
iss := "https://sunbirded.org/auth/realms/sunbird"
private_ingressgateway_ip := "1.2.3.4"

test_get_report {
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
            "path": "/report/get/1656a060-bf3a-11ec-b495-9fb99cdeb463"
          }
        }
      }
    }
}

test_get_report_internal_request {
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
            "path": "/report/get/1656a060-bf3a-11ec-b495-9fb99cdeb463",
            "host": "1.2.3.4"
          }
        }
      }
    }
}

test_list_reports {
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
            "path": "/report/list"
          }
        }
      },
      "parsed_body": {
        "request": {
          "filters": {}
        }
      }
    }
}

test_list_reports_without_user_token {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {},
            "path": "/report/list"
          }
        }
      },
      "parsed_body": {
        "request": {
          "filters": {}
        }
      }
    }
}

test_create_report {
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
            "path": "/report/create"
          }
        }
      },
      "parsed_body": {
        "request": {
          "report": {
            "title": "string",
            "description": "string",
            "authorizedroles": ["string"],
            "status": "string",
            "type": "string",
            "createdby": "28b0d08f-c2ea-40d1-bcd0-8ae00fca66be",
            "reportconfig": {
              "id": "string",
              "label": "string",
              "title": "string",
              "description": "string",
            },
            "slug": "string",
            "reportgenerateddate": "string",
            "updatefrequency": "string"
          }
        }
      }
    }
}

test_create_report_internal_request {
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
            "path": "/report/create",
            "host": "1.2.3.4"
          }
        }
      },
      "parsed_body": {
        "request": {
          "report": {
            "title": "string",
            "description": "string",
            "authorizedroles": ["string"],
            "status": "string",
            "type": "string",
            "createdby": "28b0d08f-c2ea-40d1-bcd0-8ae00fca66be",
            "reportconfig": {
              "id": "string",
              "label": "string",
              "title": "string",
              "description": "string",
            },
            "slug": "string",
            "reportgenerateddate": "string",
            "updatefrequency": "string"
          }
        }
      }
    }
}

test_delete_report {
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
            "path": "/report/delete/1656a060-bf3a-11ec-b495-9fb99cdeb463"
          }
        }
      }
    }
}

test_update_report {
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
            "path": "/report/update"
          }
        }
      },
      "parsed_body": {
        "request": {
          "report": {}
        }
      }
    }
}

test_update_report_internal_request {
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
            "path": "/report/update",
            "host": "1.2.3.4"
          }
        }
      },
      "parsed_body": {
        "request": {
          "report": {}
        }
      }
    }
}

test_publish_report {
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
            "path": "/report/publish/1656a060-bf3a-11ec-b495-9fb99cdeb463"
          }
        }
      }
    }
}

test_retire_report {
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
            "path": "/report/retire/1656a060-bf3a-11ec-b495-9fb99cdeb463"
          }
        }
      }
    }
}

test_get_report_summary {
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
            "path": "/report/summary/1656a060-bf3a-11ec-b495-9fb99cdeb463"
          }
        }
      }
    }
}

test_list_report_summary {
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
            "path": "/report/summary/list"
          }
        }
      },
      "parsed_body": {
        "request": {
          "filters": {
            "reportid": "string"
          }
        }
      }
    }
}

test_create_report_summary {
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
            "path": "/report/summary/create"
          }
        }
      },
      "parsed_body": {
        "request": {
          "summary": {
            "reportid": "string",
            "createdby": "28b0d08f-c2ea-40d1-bcd0-8ae00fca66be",
            "summary": "string"
          }
        }
      }
    }
}

test_get_report_datasets {
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
            "path": "/report/datasets/get/1656a060-bf3a-11ec-b495-9fb99cdeb463"
          }
        }
      }
    }
}

test_get_report_datasets_without_user_token {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {},
            "path": "/report/datasets/get/1656a060-bf3a-11ec-b495-9fb99cdeb463"
          }
        }
      }
    }
}