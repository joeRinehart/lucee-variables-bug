component extends="domain.Shape" persistent="true" entityName="PersistentCircleWithConstructor" accessors="true" {
    property name="id";

    function init() {
        variables._simpleProp = '';
        variables._structProp = {};
        variables._arrayProp = [];
        variables._carProp = createObject("component","domain.Car");
        return this;
    }
}