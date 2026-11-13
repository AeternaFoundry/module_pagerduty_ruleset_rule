output "ruleset_rules_id" {
  description = "Map of id values across all ruleset_rules, keyed the same as var.ruleset_rules"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => v.id }
}
output "ruleset_rules_actions" {
  description = "Map of actions values across all ruleset_rules, keyed the same as var.ruleset_rules"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => one(v.actions) }
}
output "ruleset_rules_catch_all" {
  description = "Map of catch_all values across all ruleset_rules, keyed the same as var.ruleset_rules"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => v.catch_all }
}
output "ruleset_rules_conditions" {
  description = "Map of conditions values across all ruleset_rules, keyed the same as var.ruleset_rules"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => one(v.conditions) }
}
output "ruleset_rules_disabled" {
  description = "Map of disabled values across all ruleset_rules, keyed the same as var.ruleset_rules"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => v.disabled }
}
output "ruleset_rules_position" {
  description = "Map of position values across all ruleset_rules, keyed the same as var.ruleset_rules"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => v.position }
}
output "ruleset_rules_ruleset" {
  description = "Map of ruleset values across all ruleset_rules, keyed the same as var.ruleset_rules"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => v.ruleset }
}
output "ruleset_rules_time_frame" {
  description = "Map of time_frame values across all ruleset_rules, keyed the same as var.ruleset_rules"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => one(v.time_frame) }
}
output "ruleset_rules_variable" {
  description = "Map of variable values across all ruleset_rules, keyed the same as var.ruleset_rules"
  value       = { for k, v in pagerduty_ruleset_rule.ruleset_rules : k => v.variable }
}

