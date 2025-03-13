function ViolincException(_code, _description) constructor {
    code = _code;
    description = _description;
}

// -------------------
// Creating exceptions
// -------------------

ViolincException.method_not_implemented = function(_caller, _method) {
    return new ViolincException(
        $"violinc_method_not_implemented",
        $"{instanceof(_caller)}.{_method} is not implemented."
        );
}

ViolincException.variable_cannot_write = function(_variable) {
    var _message = !is_undefined(_variable.name)
        ? $"The {instanceof(_variable)} variable '{_variable.name}' cannot be written to."
        : $"This instance of {instanceof(_variable)} cannot be written to.";
    
    return new ViolincException($"violinc_variable_cannot_write", _message);
}

ViolincException.command_disabled_execution = function() {
    return new ViolincException(
        $"violinc_command_disabled_execution",
        $"Attempting to execute a disabled command. Make sure to check if the command is enabled before execution."
        );
}
