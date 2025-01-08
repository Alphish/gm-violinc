function ViolincBinding() constructor {
    source_variable = undefined;
    source_index = undefined;
    
    static accept = function(_new, _old) {
        throw ViolincException.method_not_implemented(self, "accept");
    }
    
    static send = function(_value) {
        source_variable.set_value(_value);
    }
    
    static refresh = function() {
        source_variable.update_value();
    }
    
    static link_to = function(_variable) {
        if (!is_undefined(source_variable))
            unlink();
        
        source_variable = _variable;
        source_index = array_length(source_variable.bindings);
        array_push(source_variable.bindings, self);
        accept(source_variable.value, source_variable.value);
    }
    
    static linked_to = function(_variable) {
        link_to(_variable);
        return self;
    }
    
    static unlink = function() {
        var _last_element = array_last(source_variable.bindings);
        if (self == _last_element) {
            array_pop(source_variable.bindings);
        } else {
            source_variable[source_index] = _last_element;
            _last_element.source_index = source_index;
        }
        source_variable = undefined;
        source_index = undefined;
    }
}
