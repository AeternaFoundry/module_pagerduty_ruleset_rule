resource "pagerduty_ruleset_rule" "ruleset_rules" {
  for_each = var.ruleset_rules

  ruleset   = each.value.ruleset
  catch_all = each.value.catch_all
  disabled  = each.value.disabled
  position  = each.value.position

  dynamic "actions" {
    for_each = each.value.actions != null ? [each.value.actions] : []
    content {
      dynamic "annotate" {
        for_each = actions.value.annotate != null ? actions.value.annotate : []
        content {
          value = annotate.value.value
        }
      }
      dynamic "event_action" {
        for_each = actions.value.event_action != null ? actions.value.event_action : []
        content {
          value = event_action.value.value
        }
      }
      dynamic "extractions" {
        for_each = actions.value.extractions != null ? actions.value.extractions : []
        content {
          regex    = extractions.value.regex
          source   = extractions.value.source
          target   = extractions.value.target
          template = extractions.value.template
        }
      }
      dynamic "priority" {
        for_each = actions.value.priority != null ? actions.value.priority : []
        content {
          value = priority.value.value
        }
      }
      dynamic "route" {
        for_each = actions.value.route != null ? actions.value.route : []
        content {
          value = route.value.value
        }
      }
      dynamic "severity" {
        for_each = actions.value.severity != null ? actions.value.severity : []
        content {
          value = severity.value.value
        }
      }
      dynamic "suppress" {
        for_each = actions.value.suppress != null ? actions.value.suppress : []
        content {
          threshold_time_amount = suppress.value.threshold_time_amount
          threshold_time_unit   = suppress.value.threshold_time_unit
          threshold_value       = suppress.value.threshold_value
          value                 = suppress.value.value
        }
      }
      dynamic "suspend" {
        for_each = actions.value.suspend != null ? actions.value.suspend : []
        content {
          value = suspend.value.value
        }
      }
    }
  }

  dynamic "conditions" {
    for_each = each.value.conditions != null ? [each.value.conditions] : []
    content {
      operator = conditions.value.operator
      dynamic "subconditions" {
        for_each = conditions.value.subconditions != null ? conditions.value.subconditions : []
        content {
          operator = subconditions.value.operator
          dynamic "parameter" {
            for_each = subconditions.value.parameter != null ? subconditions.value.parameter : []
            content {
              path  = parameter.value.path
              value = parameter.value.value
            }
          }
        }
      }
    }
  }

  dynamic "time_frame" {
    for_each = each.value.time_frame != null ? [each.value.time_frame] : []
    content {
      dynamic "active_between" {
        for_each = time_frame.value.active_between != null ? time_frame.value.active_between : []
        content {
          end_time   = active_between.value.end_time
          start_time = active_between.value.start_time
        }
      }
      dynamic "scheduled_weekly" {
        for_each = time_frame.value.scheduled_weekly != null ? time_frame.value.scheduled_weekly : []
        content {
          duration   = scheduled_weekly.value.duration
          start_time = scheduled_weekly.value.start_time
          timezone   = scheduled_weekly.value.timezone
          weekdays   = scheduled_weekly.value.weekdays
        }
      }
    }
  }

  dynamic "variable" {
    for_each = each.value.variable != null ? each.value.variable : []
    content {
      name = variable.value.name
      dynamic "parameters" {
        for_each = variable.value.parameters != null ? variable.value.parameters : []
        content {
          path  = parameters.value.path
          value = parameters.value.value
        }
      }
      type = variable.value.type
    }
  }
}

