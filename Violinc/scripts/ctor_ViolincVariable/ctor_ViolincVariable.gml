function ViolincVariable() constructor {
    value = undefined;
    receivers = [];
    
    static get_value = function() {
        update_value();
        return value;
    }
    
    static update_value = function() {
        throw $"{instanceof(self)}.update_value is not implemented.";
    }
    
    static coerce_value = function(_value) {
        return _value;
    }
    
    static set_value = function(_value) {
        _value = coerce_value(_value);
        if (value == _value)
            return;
        
        var _old_value = _value;
        update_source(_value, _old_value);
        update_value();
        send_value(_value, _old_value);
    }
    
    static update_source = function(_new, _old) {
        throw $"{instanceof(self)}.update_source is not implemented.";
    }
    
    static send_value = function(_new, _old) {
        for (var i = 0, _count = array_length(receivers); i < _count; i++) {
            receivers[i].receive(_new, _old);
        }
    }
}
