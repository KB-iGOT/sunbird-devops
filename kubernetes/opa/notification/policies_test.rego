package tests

# The tokens used in test cases expire on 1640236102
# So we set the current_time to a few minutes earlier than the expiry
# This will ensure the test cases succeed

current_time := 1640235102
iss := "https://sunbirded.org/auth/realms/sunbird"

test_read_notification_feed {
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
            "path": "/v1/notification/feed/read/28b0d08f-c2ea-40d1-bcd0-8ae00fca66be"
          }
        }
      }
    }
}

test_delete_notification_feed {
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
            "path": "/v1/notification/feed/delete"
          }
        }
      },
      "parsed_body": {
        "request": {
          "ids": ["f1493e8b-9584-4c3d-bf5d-d227a3926853"],
          "userId": "28b0d08f-c2ea-40d1-bcd0-8ae00fca66be",
          "category": "group-feed"
        }
      }
    }
}

test_update_notification_feed {
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
            "path": "/v1/notification/feed/update"
          }
        }
      },
      "parsed_body": {
        "request": {
            "ids": ["f1493e8b-9584-4c3d-bf5d-d227a3926853"],
            "userId": "28b0d08f-c2ea-40d1-bcd0-8ae00fca66be",
            "category": "group-feed",
            "priority":1,
            "data":{
                "data":"user feed updated"
            }
        }
      }
    }
}