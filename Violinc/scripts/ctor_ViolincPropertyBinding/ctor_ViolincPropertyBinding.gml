function ViolincPropertyBinding(_owner, _property) : ViolincBinding() constructor {
    owner = _owner;
    property = _property;
    
    static accept = function(_value) {
        owner[$ property] = _value;
    }
}
