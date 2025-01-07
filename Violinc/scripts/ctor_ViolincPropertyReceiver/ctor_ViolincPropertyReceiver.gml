function ViolincPropertyReceiver(_instance, _property) : ViolincReceiver() constructor {
    instance = _instance;
    property = _property;
    
    static receive = function(_value) {
        instance[$ property] = _value;
    }
}
