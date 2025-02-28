#include <iostream>
#include <string>

class Example {
private:
    std::string name;

public:
    Example(std::string n) : name(n) {}
    
    void greet() {
        std::cout << "Hello from " << name << std::endl;
    }
};

int main() {
    Example ex("Test");
    ex.greet();
    return 0;
}
