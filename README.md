Example of what our team believes is a bug in Lucee's handling of the variables scope
when components do not re-initialize values within their constructor: values in 
the pseudo-constructor become essentially static (scoped to the component),
unlike what happens in non-persistent components.

* Open a shell to .src
* `docker-compose -f docker-compose.yml up --build`
* Hit http://localhost:8890/tests/
* Note the failing spec