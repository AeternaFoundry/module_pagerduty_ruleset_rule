variable "ruleset_rules" {
  description = <<EOT
Map of ruleset_rules, attributes below
Required:
    - ruleset
Optional:
    - catch_all
    - disabled
    - position
    - actions (block):
        - annotate (optional, block):
            - value (optional)
        - event_action (optional, block):
            - value (optional)
        - extractions (optional, block):
            - regex (optional)
            - source (optional)
            - target (optional)
            - template (optional)
        - priority (optional, block):
            - value (optional)
        - route (optional, block):
            - value (optional)
        - severity (optional, block):
            - value (optional)
        - suppress (optional, block):
            - threshold_time_amount (optional)
            - threshold_time_unit (optional)
            - threshold_value (optional)
            - value (optional)
        - suspend (optional, block):
            - value (optional)
    - conditions (block):
        - operator (optional)
        - subconditions (optional, block):
            - operator (optional)
            - parameter (optional, block):
                - path (optional)
                - value (optional)
    - time_frame (block):
        - active_between (optional, block):
            - end_time (optional)
            - start_time (optional)
        - scheduled_weekly (optional, block):
            - duration (optional)
            - start_time (optional)
            - timezone (optional)
            - weekdays (optional)
    - variable (block):
        - name (optional)
        - parameters (optional, block):
            - path (optional)
            - value (optional)
        - type (optional)
EOT

  type = map(object({
    ruleset   = string
    catch_all = optional(bool)
    disabled  = optional(bool)
    position  = optional(number)
    actions = optional(object({
      annotate = optional(list(object({
        value = optional(string)
      })))
      event_action = optional(list(object({
        value = optional(string)
      })))
      extractions = optional(list(object({
        regex    = optional(string)
        source   = optional(string)
        target   = optional(string)
        template = optional(string)
      })))
      priority = optional(list(object({
        value = optional(string)
      })))
      route = optional(list(object({
        value = optional(string)
      })))
      severity = optional(list(object({
        value = optional(string)
      })))
      suppress = optional(list(object({
        threshold_time_amount = optional(number)
        threshold_time_unit   = optional(string)
        threshold_value       = optional(number)
        value                 = optional(bool)
      })))
      suspend = optional(list(object({
        value = optional(number)
      })))
    }))
    conditions = optional(object({
      operator = optional(string)
      subconditions = optional(list(object({
        operator = optional(string)
        parameter = optional(list(object({
          path  = optional(string)
          value = optional(string)
        })))
      })))
    }))
    time_frame = optional(object({
      active_between = optional(list(object({
        end_time   = optional(number)
        start_time = optional(number)
      })))
      scheduled_weekly = optional(list(object({
        duration   = optional(number)
        start_time = optional(number)
        timezone   = optional(string)
        weekdays   = optional(list(number))
      })))
    }))
    variable = optional(list(object({
      name = optional(string)
      parameters = optional(list(object({
        path  = optional(string)
        value = optional(string)
      })))
      type = optional(string)
    })))
  }))
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

