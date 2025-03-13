function ViolincCommand() constructor {
    is_enabled = true;
    
    static execute = function() {
        throw ViolincException.method_not_implemented(self, "execute");
    }
    
    static cleanup = function() {
        // nothing by default
    }
}
