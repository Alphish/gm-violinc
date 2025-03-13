max_hp = 50;
hp_variable = new ViolincValue(max_hp);
hp_variable.coerce_value = function(_value) {
    return clamp(_value, 0, max_hp);
}

can_heal_variable = new ViolincVariableMapping(hp_variable, function(_hp) { return _hp < max_hp; });

fullcure_command = new ViolincBasicCommand(function() { hp_variable.set_value(max_hp); })
    .with_enabled_binding(can_heal_variable);
