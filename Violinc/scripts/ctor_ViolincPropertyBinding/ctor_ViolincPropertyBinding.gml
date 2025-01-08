function ViolincPropertyBinding(_instance, _property) : ViolincBinding() constructor {
    instance = _instance;
    property = _property;
    
    static accept = function(_value) {
        instance[$ property] = _value;
    }
}
