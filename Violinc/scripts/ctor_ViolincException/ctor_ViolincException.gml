function ViolincException(_code, _description) constructor {
    code = _code;
    description = _description;
}

// -------------------
// Creating exceptions
// -------------------

ViolincException.method_not_implemented = function(_caller, _method) {
    return new ViolincException(
        $"violinc_not_implemented",
        $"{instanceof(_caller)}.{_method} is not implemented."
        );
}
