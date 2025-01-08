function ViolincVoidBinding() constructor {
    static send = function(_value) {}
    static refresh = function() {}
}

ViolincVoidBinding.instance = new ViolincVoidBinding(); 
