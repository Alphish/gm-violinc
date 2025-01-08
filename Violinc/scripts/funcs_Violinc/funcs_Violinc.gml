function violinc_instance_setup(_instance = undefined) {
    with (_instance ?? self) {
        violinc_bindings = [];
    }
}

function violinc_instance_cleanup(_instance = undefined) {
    with (_instance ?? self) {
        array_foreach(violinc_bindings, function(_binding) { _binding.unlink(); });
    }
}

function violinc_try_bind_property(_variable, _property, _instance = undefined, _bindings = undefined) {
    if (!is_instanceof(_variable, ViolincVariable))
        return ViolincVoidBinding.instance;
    
    _instance ??= (instance_exists(self) ? id : self);
    _bindings ??= _instance.violinc_bindings;
    
    var _binding = new ViolincPropertyBinding(_instance, _property).linked_to(_variable);
    array_push(_bindings, _binding);
    return _binding;
}
