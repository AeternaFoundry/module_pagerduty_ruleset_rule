output "ruleset_rules_id" {
  description = "Map of id values across all ruleset_rules, keyed the same as var.ruleset_rules except keys with no id are omitted"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ruleset_rules_actions" {
  description = "Map of actions values across all ruleset_rules, keyed the same as var.ruleset_rules except keys with no actions are omitted"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => one(v.actions) if v.actions != null && length(v.actions) > 0 }
}
output "ruleset_rules_catch_all" {
  description = "Map of catch_all values across all ruleset_rules, keyed the same as var.ruleset_rules except keys with no catch_all are omitted"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => v.catch_all if v.catch_all != null }
}
output "ruleset_rules_conditions" {
  description = "Map of conditions values across all ruleset_rules, keyed the same as var.ruleset_rules except keys with no conditions are omitted"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => one(v.conditions) if v.conditions != null && length(v.conditions) > 0 }
}
output "ruleset_rules_disabled" {
  description = "Map of disabled values across all ruleset_rules, keyed the same as var.ruleset_rules except keys with no disabled are omitted"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => v.disabled if v.disabled != null }
}
output "ruleset_rules_position" {
  description = "Map of position values across all ruleset_rules, keyed the same as var.ruleset_rules except keys with no position are omitted"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => v.position if v.position != null }
}
output "ruleset_rules_ruleset" {
  description = "Map of ruleset values across all ruleset_rules, keyed the same as var.ruleset_rules except keys with no ruleset are omitted"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => v.ruleset if v.ruleset != null && length(v.ruleset) > 0 }
}
output "ruleset_rules_time_frame" {
  description = "Map of time_frame values across all ruleset_rules, keyed the same as var.ruleset_rules except keys with no time_frame are omitted"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => one(v.time_frame) if v.time_frame != null && length(v.time_frame) > 0 }
}
output "ruleset_rules_variable" {
  description = "Map of variable values across all ruleset_rules, keyed the same as var.ruleset_rules except keys with no variable are omitted"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => v.variable if v.variable != null && length(v.variable) > 0 }
}

