component {
    variables._simpleProp = "";

    function getSimpleProp() {
        return variables._simpleProp;
    }
    function setSimpleProp(v) {
        variables._simpleProp = v;
    }

    variables._structProp = {};

    function getStructProp() {
        return variables._structProp;
    }
    function setStructProp(v) {
        variables._structProp = v;
    }
    
    variables._arrayProp = [];

    function getArrayProp() {
        return variables._arrayProp;
    }
    function setArrayProp(v) {
        variables._arrayProp = v;
    }
    
    
    variables._carProp = createObject("component","domain.Car");

    function getCarProp() {
        return variables._carProp;
    }
    function setCarProp(v) {
        variables._carProp = v;
    }

}