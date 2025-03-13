function ViolincVariableUpdateBinding(_variable) : ViolincBinding() constructor {
    variable = _variable;
    
    static accept = function() {
        variable.update_value();
    }
}
