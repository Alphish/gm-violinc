value_receiver = undefined;
if (is_instanceof(value, ViolincVariable)) {
    value_receiver = new ViolincPropertyReceiver(id, nameof(value));
    value_receiver.link_to(value);
}
