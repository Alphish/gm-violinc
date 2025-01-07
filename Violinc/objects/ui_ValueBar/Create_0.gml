value_receiver = undefined;
if (is_instanceof(value, ViolincVariable)) {
    value_receiver = new ViolincPropertyReceiver(id, nameof(value));
    value_receiver.link_to(value);
}

max_value_receiver = undefined;
if (is_instanceof(max_value, ViolincVariable)) {
    max_value_receiver = new ViolincPropertyReceiver(id, nameof(max_value));
    max_value_receiver.link_to(max_value);
}
