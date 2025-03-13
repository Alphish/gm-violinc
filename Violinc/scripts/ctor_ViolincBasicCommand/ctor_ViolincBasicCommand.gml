function ViolincBasicCommand(_callback, _parameter = undefined) : ViolincCommand() constructor {
    callback = _callback;
    parameter = _parameter;
    
    enabled_binding = undefined;
    parameter_binding = undefined;
    
    static execute = function() {
        if (!is_enabled)
            throw ViolincException.disabled_command_execution();
        
        callback(parameter);
    }
    
    static with_parameter = function(_parameter) {
        parameter = _parameter;
        return self;
    }
    
    static with_enabled_binding = function(_variable) {
        if (!is_undefined(enabled_binding))
            enabled_binding.unlink();
        
        enabled_binding = new ViolincPropertyBinding(self, nameof(is_enabled)).linked_to(_variable);
        return self;
    }
    
    static with_parameter_binding = function(_variable) {
        if (!is_undefined(parameter_binding))
            parameter_binding.unlink();
        
        parameter_binding = new ViolincPropertyBinding(self, nameof(parameter)).linked_to(_variable);
        return self;
    }
    
    static cleanup = function() {
        if (!is_undefined(enabled_binding))
            enabled_binding.unlink();
        
        if (!is_undefined(parameter_binding))
            parameter_binding.unlink();
    }
}
