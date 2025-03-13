function ViolincVariableMapping(_source, _fromsource, _tosource = undefined) : ViolincVariable() constructor {
    source_variable = _source;
    map_from_source = _fromsource;
    map_to_source = _tosource;
    
    value = map_from_source(source_variable.get_value());
    update_binding = new ViolincVariableUpdateBinding(self).linked_to(source_variable);
    
    static retrieve_value = function() {
        return map_from_source(source_variable.value);
    }
    
    static update_source = function(_value) {
        if (is_undefined(map_to_source))
            throw ViolincVariable.variable_cannot_write(self);
        
        var _transformed = map_to_source(_value);
        source_variable.set_value(_transformed);
    }
    
    static cleanup = function() {
        update_binding.unlink();
    }
}
