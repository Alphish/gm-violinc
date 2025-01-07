function ViolincValue(_initial = undefined) : ViolincVariable() constructor {
    value = _initial;
    
    static update_value = function() {
        // the variable holds the value directly, no need to 
    }
    
    static update_source = function(_value) {
        value = _value;
    }
}
