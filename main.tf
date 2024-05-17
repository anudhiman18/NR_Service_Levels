resource "newrelic_service_level" "service_level" {
    guid = var.service_level.guid
    name = var.service_level.name
    description = var.service_level.description

    events {
        account_id = var.service_level.account_id
        valid_events {
            from = "Log"
          select {
            function = "COUNT"
          }
        }
        good_events {
            from = "Log"
         select {
            function = "COUNT"
         }
        }
    }

    objective {
        target = var.service_level.target
        time_window {
            rolling {
                count = var.service_level.count
                unit = var.service_level.unit
            }
        }
    }
}

