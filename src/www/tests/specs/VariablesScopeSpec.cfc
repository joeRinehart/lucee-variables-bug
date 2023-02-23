component extends="testbox.system.BaseSpec" {

	function beforeAll() {
        ormReload();
	}

    function run() {
        describe("When referencing members of the variables scope for transient CFCs by reference", function() {
            it("Simple values should not be shared across instances", function() {
                var circle1 = createObject( 'Component', 'domain.transient.Circle' );
                var circle2 = createObject( 'Component', 'domain.transient.Circle' );

                // expect
                expect( circle1.getSimpleProp()).toBe('');
                expect( circle2.getSimpleProp()).toBe('');

                // when
                circle2.setSimpleProp('This was a simple value set on circle 2');

                // then
                expect( circle2.getSimpleProp()).toBe('This was a simple value set on circle 2');
                expect( circle1.getSimpleProp()).notToBe('This was a simple value set on circle 2');
            });

            it("Array values should not be shared across instances", function() {
                var circle1 = createObject( 'Component', 'domain.transient.Circle' );
                var circle2 = createObject( 'Component', 'domain.transient.Circle' );

                // expect
                expect( arrayLen(circle1.getArrayProp()) ).toBe(0);
                expect( arrayLen(circle2.getArrayProp()) ).toBe(0);

                // when
                var arrayProp = circle2.getArrayProp();
                arrayProp[1] = 'Array prop in circle 2!';

                // then
                expect( arrayLen(circle2.getArrayProp()) ).toBe(1);
                expect( arrayLen(circle1.getArrayProp()) ).toBe(0, "Circle one's array was changed!");
            });

            it("Struct values should not be shared across instances", function() {
                var circle1 = createObject( 'Component', 'domain.transient.Circle' );
                var circle2 = createObject( 'Component', 'domain.transient.Circle' );

                // expect
                expect( structCount(circle1.getStructProp()) ).toBe(0);
                expect( structCount(circle2.getStructProp()) ).toBe(0);

                // when
                var structProp = circle2.getStructProp();
                structProp.value = 'Struct prop in circle 2!';

                // then
                expect( structCount(circle2.getStructProp()) ).toBe(1);
                expect( structCount(circle1.getStructProp()) ).toBe(0, "Circle one's struct was changed!");
            });

            it("Component values should not be shared across instances", function() {
                var circle1 = createObject( 'Component', 'domain.transient.Circle' );
                var circle2 = createObject( 'Component', 'domain.transient.Circle' );

                // expect
                expect( circle1.getCarProp().getName() ).toBe('');
                expect( circle2.getCarProp().getName() ).toBe('');

                // when
                var carProp = circle2.getCarProp();
                carProp.setName('Morgan');

                // then
                expect( circle2.getCarProp().getName() ).toBe('Morgan');
                expect( circle1.getCarProp().getName() ).notToBe('Morgan', "Circle 1's car name was changed!");
            });
        });
        

        describe("When changing members of the variables scope for persistent CFCs by passing a new value to a setter", function() {
            it("Simple values should not be shared across instances", function() {
                var circle1 = entityNew( 'PersistentCircle' );
                var circle2 = entityNew( 'PersistentCircle' );

                // expect
                expect( circle1.getSimpleProp()).toBe('');
                expect( circle2.getSimpleProp()).toBe('');

                // when
                circle2.setSimpleProp('This was a simple value set on circle 2');

                // then
                expect( circle2.getSimpleProp()).toBe('This was a simple value set on circle 2');
                expect( circle1.getSimpleProp()).notToBe('This was a simple value set on circle 2');
            });

            it("Array values should not be shared across instances", function() {
                var circle1 = entityNew( 'PersistentCircle' );
                var circle2 = entityNew( 'PersistentCircle' );

                // expect
                expect( arrayLen(circle1.getArrayProp()) ).toBe(0);
                expect( arrayLen(circle2.getArrayProp()) ).toBe(0);

                // when
                circle2.setArrayProp(['Array prop in circle 2!']);

                // then
                expect( arrayLen(circle2.getArrayProp()) ).toBe(1);
                expect( arrayLen(circle1.getArrayProp()) ).toBe(0, "Circle one's array was changed!");
            });

            it("Struct values should not be shared across instances", function() {
                var circle1 = entityNew( 'PersistentCircle' );
                var circle2 = entityNew( 'PersistentCircle' );

                // expect
                expect( structCount(circle1.getStructProp()) ).toBe(0);
                expect( structCount(circle2.getStructProp()) ).toBe(0);

                // when
                circle2.setStructProp({value: 'Struct prop in circle 2!'});

                // then
                expect( structCount(circle2.getStructProp()) ).toBe(1);
                expect( structCount(circle1.getStructProp()) ).toBe(0, "Circle one's struct was changed!");
            });

            it("Component values should not be shared across instances", function() {
                var circle1 = entityNew( 'PersistentCircle' );
                var circle2 = entityNew( 'PersistentCircle' );

                // expect
                expect( circle1.getCarProp().getName() ).toBe('');
                expect( circle2.getCarProp().getName() ).toBe('');

                // when
                var aNewCaaaaaaaar = createObject('component', 'domain.Car');
                aNewCaaaaaaaar.setName('Morgan');
                circle2.setCarProp( aNewCaaaaaaaar );

                // then
                expect( circle2.getCarProp().getName() ).toBe('Morgan');
                expect( circle1.getCarProp().getName() ).notToBe('Morgan', "Circle 1's car name was changed!");
            });
        });

        describe("When referencing members of the variables scope for constructorless persistent CFCs by reference", function() {
            it("Simple values should not be shared across instances", function() {
                var circle1 = entityNew( 'PersistentCircle' );
                var circle2 = entityNew( 'PersistentCircle' );

                // expect
                expect( circle1.getSimpleProp()).toBe('');
                expect( circle2.getSimpleProp()).toBe('');

                // when
                circle2.setSimpleProp('This was a simple value set on circle 2');

                // then
                expect( circle2.getSimpleProp()).toBe('This was a simple value set on circle 2');
                expect( circle1.getSimpleProp()).notToBe('This was a simple value set on circle 2');
            });

            it("Array values should not be shared across instances", function() {
                var circle1 = entityNew( 'PersistentCircle' );
                var circle2 = entityNew( 'PersistentCircle' );

                // expect
                expect( arrayLen(circle1.getArrayProp()) ).toBe(0);
                expect( arrayLen(circle2.getArrayProp()) ).toBe(0);

                // when
                var arrayProp = circle2.getArrayProp();
                arrayProp[1] = 'Array prop in circle 2!';

                // then
                expect( arrayLen(circle2.getArrayProp()) ).toBe(1);
                expect( arrayLen(circle1.getArrayProp()) ).toBe(0, "Circle one's array was changed!");
            });

            it("Struct values should not be shared across instances", function() {
                var circle1 = entityNew( 'PersistentCircle' );
                var circle2 = entityNew( 'PersistentCircle' );

                // expect
                expect( structCount(circle1.getStructProp()) ).toBe(0);
                expect( structCount(circle2.getStructProp()) ).toBe(0);

                // when
                var structProp = circle2.getStructProp();
                structProp.value = 'Struct prop in circle 2!';

                // then
                expect( structCount(circle2.getStructProp()) ).toBe(1);
                expect( structCount(circle1.getStructProp()) ).toBe(0, "Circle one's struct was changed!");
            });

            it("Component values should not be shared across instances", function() {
                var circle1 = entityNew( 'PersistentCircle' );
                var circle2 = entityNew( 'PersistentCircle' );

                // expect
                expect( circle1.getCarProp().getName() ).toBe('');
                expect( circle2.getCarProp().getName() ).toBe('');

                // when
                var carProp = circle2.getCarProp();
                carProp.setName('Morgan');

                // then
                expect( circle2.getCarProp().getName() ).toBe('Morgan');
                expect( circle1.getCarProp().getName() ).notToBe('Morgan', "Circle 1's car name was changed!");
            });
        });

        describe("When referencing members of the variables scope for persistent CFCs that have constructors by reference", function() {
            it("Simple values should not be shared across instances", function() {
                var circle1 = entityNew( 'PersistentCircleWithConstructor' );
                var circle2 = entityNew( 'PersistentCircleWithConstructor' );

                // expect
                expect( circle1.getSimpleProp()).toBe('');
                expect( circle2.getSimpleProp()).toBe('');

                // when
                circle2.setSimpleProp('This was a simple value set on circle 2');

                // then
                expect( circle2.getSimpleProp()).toBe('This was a simple value set on circle 2');
                expect( circle1.getSimpleProp()).notToBe('This was a simple value set on circle 2');
            });

            it("Array values should not be shared across instances", function() {
                var circle1 = entityNew( 'PersistentCircleWithConstructor' );
                var circle2 = entityNew( 'PersistentCircleWithConstructor' );

                // expect
                expect( arrayLen(circle1.getArrayProp()) ).toBe(0);
                expect( arrayLen(circle2.getArrayProp()) ).toBe(0);

                // when
                var arrayProp = circle2.getArrayProp();
                arrayProp[1] = 'Array prop in circle 2!';

                // then
                expect( arrayLen(circle2.getArrayProp()) ).toBe(1);
                expect( arrayLen(circle1.getArrayProp()) ).toBe(0, "Circle one's array was changed!");
            });

            it("Struct values should not be shared across instances", function() {
                var circle1 = entityNew( 'PersistentCircleWithConstructor' )
                var circle2 = entityNew( 'PersistentCircleWithConstructor' )

                // expect
                expect( structCount(circle1.getStructProp()) ).toBe(0);
                expect( structCount(circle2.getStructProp()) ).toBe(0);

                // when
                var structProp = circle2.getStructProp();
                structProp.value = 'Struct prop in circle 2!';

                // then
                expect( structCount(circle2.getStructProp()) ).toBe(1);
                expect( structCount(circle1.getStructProp()) ).toBe(0, "Circle one's struct was changed!");
            });

            it("Component values should not be shared across instances", function() {
                var circle1 = entityNew( 'PersistentCircleWithConstructor' );
                var circle2 = entityNew( 'PersistentCircleWithConstructor' );

                // expect
                expect( circle1.getCarProp().getName() ).toBe('');
                expect( circle2.getCarProp().getName() ).toBe('');

                // when
                var carProp = circle2.getCarProp();
                carProp.setName('Morgan');

                // then
                expect( circle2.getCarProp().getName() ).toBe('Morgan');
                expect( circle1.getCarProp().getName() ).notToBe('Morgan', "Circle 1's car name was changed!");
            });
        });

    };

}