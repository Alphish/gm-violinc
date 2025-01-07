max_hp = 50;
hp_variable = new ViolincValue(max_hp);
hp_variable.coerce_value = function(_value) {
    return clamp(_value, 0, max_hp);
}
