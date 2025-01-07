function ViolincReceiver() constructor {
    source_variable = undefined;
    source_index = undefined;
    
    static receive = function(_new, _old) {
        throw $"{instanceof(self)}.receive is not implemented.";
    }
    
    static link_to = function(_variable) {
        if (!is_undefined(source_variable))
            unlink();
        
        source_variable = _variable;
        source_index = array_length(source_variable.receivers);
        array_push(source_variable.receivers, self);
        receive(source_variable.value, source_variable.value);
    }
    
    static unlink = function() {
        var _last_element = array_last(source_variable.receivers);
        if (self == _last_element) {
            array_pop(source_variable.receivers);
        } else {
            source_variable[source_index] = _last_element;
            _last_element.source_index = source_index;
        }
        source_variable = undefined;
        source_index = undefined;
    }
}
