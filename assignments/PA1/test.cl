class A {
	f():Int {1};
};

class B inherits A {
	--f():String {"1"};
    f():Int {2};
};

class Main {
	p:A <- (new A);
	main() : Object {
		p.f()+1
	};
};