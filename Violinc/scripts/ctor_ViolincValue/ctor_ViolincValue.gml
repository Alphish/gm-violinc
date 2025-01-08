function ViolincValue(_initial = undefined) : ViolincVariable() constructor {
    value = _initial;
    
    static retrieve_value = function() {
        return value;
    }
    
    static update_source = function(_value) {
        value = _value;
    }
}
