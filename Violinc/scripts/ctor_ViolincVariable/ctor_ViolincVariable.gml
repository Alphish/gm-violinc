function ViolincVariable() constructor {
    name = undefined;
    value = undefined;
    bindings = [];
    
    static get_value = function() {
        update_value();
        return value;
    }
    
    static set_value = function(_value) {
        _value = coerce_value(_value);
        if (value == _value)
            return;
        
        var _old_value = value;
        update_source(_value, _old_value);
        
        _value = retrieve_value();
        send_value(_value, _old_value);
    }
    
    static set_from_source = function(_value) {
        if (value == _value)
            return;
        
        var _old_value = value;
        value = _value;
        send_value(value, _old_value);
    }
    
    static coerce_value = function(_value) {
        return _value;
    }
    
    static update_source = function(_new, _old) {
        throw ViolincException.method_not_implemented(self, "update_source");
    }
    
    static retrieve_value = function() {
        throw ViolincException.method_not_implemented(self, "retrieve_value");
    }
    
    static update_value = function() {
        set_from_source(retrieve_value());
    }
    
    static send_value = function(_new, _old) {
        for (var i = 0, _count = array_length(bindings); i < _count; i++) {
            bindings[i].accept(_new, _old);
        }
    }
    
    static with_name = function(_name) {
        name = _name;
        return self;
    }
    
    static cleanup = function() {
        // do nothing by default
    }
}
