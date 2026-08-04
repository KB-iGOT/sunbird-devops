package tests

# The tokens used in test cases expire on 1640236102
# So we set the current_time to a few minutes earlier than the expiry
# This will ensure the test cases succeed

current_time := 1640235102
iss := "https://sunbirded.org/auth/realms/sunbird"

test_get_data_exhaust_request {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "x-authenticated-user-token": "<x-authenticated-user-token>",
              "x-channel-id": "01369878797503692810",
              "x-authenticated-userid": "28b0d08f-c2ea-40d1-bcd0-8ae00fca66be"
            },
            "path": "/request/read"
          }
        }
      }
    }
}

test_get_data_exhaust_request_without_user_token_without_userid {
    data.main.allow.allowed
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "x-channel-id": "01369878797503692810"
            },
            "path": "/request/read"
          }
        }
      }
    }
}


test_list_data_exhaust_request {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "x-authenticated-user-token": "<x-authenticated-user-token>",
              "x-channel-id": "01369878797503692810",
              "x-authenticated-userid": "28b0d08f-c2ea-40d1-bcd0-8ae00fca66be"
            },
            "path": "/request/list"
          }
        }
      }
    }
}

test_list_data_exhaust_request_without_user_token_without_userid {
    data.main.allow.allowed
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "x-channel-id": "01369878797503692810"
            },
            "path": "/request/list"
          }
        }
      }
    }
}

test_submit_data_exhaust_request_with_dataset_as_progress_exhaust {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "x-authenticated-user-token": "<x-authenticated-user-token>",
              "x-channel-id": "01369878797503692810",
              "x-authenticated-userid": "28b0d08f-c2ea-40d1-bcd0-8ae00fca66be"
            },
            "path": "/request/submit"
          }
        }
      },
      "parsed_body": {
        "request": {
          "dataset": "progress-exhaust",
          "tag": "do_2132633999849390081587_0132634259344588800",
          "datasetConfig": {
            "batchId": "0132634259344588800"
          },
          "requestedBy": "fcae65a6-8a48-11ec-8c82-c7075e84952d"
        }
      }
    }
}

test_submit_data_exhaust_request_with_dataset_as_druid_dataset {
    data.main.allow.allowed
    with data.common.current_time as current_time
    with data.common.iss as iss
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "x-authenticated-user-token": "<x-authenticated-user-token>",
              "x-channel-id": "01369878797503692810",
              "x-authenticated-userid": "28b0d08f-c2ea-40d1-bcd0-8ae00fca66be"
            },
            "path": "/request/submit"
          }
        }
      },
      "parsed_body": {
        "request": {
          "dataset": "druid-dataset",
          "tag": "do_2132633999849390081587_0132634259344588800",
          "datasetConfig": {
            "batchId": "0132634259344588800"
          },
          "requestedBy": "fcae65a6-8a48-11ec-8c82-c7075e84952d"
        }
      }
    }
}

test_submit_data_exhaust_request_with_dataset_as_progress_exhaust_without_user_token_without_userid {
    data.main.allow.allowed
    with input as
    {
      "attributes": {
        "request": {
          "http": {
            "headers": {
              "x-channel-id": "01369878797503692810"
            },
            "path": "/request/submit"
          }
        }
      },
      "parsed_body": {
        "request": {
          "dataset": "progress-exhaust",
          "tag": "do_2132633999849390081587_0132634259344588800",
          "datasetConfig": {
            "batchId": "0132634259344588800"
          },
          "requestedBy": "fcae65a6-8a48-11ec-8c82-c7075e84952d"
        }
      }
    }
}