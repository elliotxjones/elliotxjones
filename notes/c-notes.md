# Notes

## About

C programming notes (e.g. syntax).

## Authors

- Elaina Jones (elainatj@tutanota.com)


## Contents


## Introduction 

- Developed in 1972 at Bell Labs by Dennis Ritchie to construct  
  utilities running on Unix.
- Successor to the B programming language.
- General purpose and widely used.
- Imperative procedural language.
- Unlike C++, does not support classes and objects, lending more to  
  "functional programming."



## Header file libraries

Syntax:  
```c
#include <stdio.h>
```
  
- `stdio.h`
    - Provides support for output functions, such as `printf()`.
- `stdbool.h`
    - Provides support for booleans; `bool` with `true` or `false`  
      keywords.


## Rules

- All programs must have `main()`.
- Every statement must end with semicolon `;`.


## Escape characters

- `\n`: newline.
- `\t`: tab.
- `\"`: double quote character.


## Comments

```c
// single line comment.

/*
Multi-line
comment.
*/
```

## Variable types

- `int`: integers without decimals.
    - e.g. `123` or `-123`
- `float`: floating point numbers, with decimals.
    - e.g. `19.99` or `-19.99`
- `char`: single characters.
    - e.g. `a` or `B`
  
Example:  
```c
int myNum = 15;
float myFloat = 14.9;
char myChar = 'a';
```

## printf

Syntax:  
`printf()`  
  
Example:  
`printf("hello world");`  
  
Format specifiers are used to tell the compiler the type of data the  
variable is storing. Consider it a placeholder for the variable  
value.  
  
Syntax starts with `%`, followd by a character.  
  
Format characters:  
- `%i` or `%d`: output the value of an `int` variable.
- `%f`: output the value of a `float` variable.
- `%c`: output the value of a `char` variable.
  
To combine both text and a variable, separate them with a comma.  
  
Example:  
`printf("My favorite number is: %d", myNum);`  
  
To print multiple different types, refer to the following example for  
syntax.  
  
```c
int myNum = 15;
char = myLetter = 'D';
printf("My number is %d and my letter is %c", myNum, myLetter);
```  

## Arithmatic operators

- `+`: addition.
- `-`: subtraction.
- `*`: multiplication.
- `/`: division.
- `%`: Modulus.
    - Returns the division remainder.
    - `x % y`
- `++`: increment.
    - Increases the value of a variable by 1.
    - `++x`
- `--`: decrement.
    - Decreases the value of a variable by 1.
    - `--x`

## Assignment operators

- `+=`: addition assignment.
    - Adds a value to a variable.
    - Same as `x = x + y`.
- `-=`: subtraction assignment.
- `*=`: multiplication assignment.
- `/=`: division assignment.
- `%=`: modulus assignment.
    - Same as `x = x % y`.
- `&=`: bitwise AND assignment.
    - Useful for adding set (1) or cleared (0) bits.
    - Resolves to
    - See also [Bitwise operation - AND](https://en.wikipedia.org/wiki/Bitwise_operation#AND).
- `|=`: bitwise OR assignment.
    - Useful for adding set (1) or cleared (0) bits.
    - See also [Bitwise operation - OR](https://en.wikipedia.org/wiki/Bitwise_operation#OR).
- `^=`: bitwise XOR (exclusive OR) assignment.
    - Useful for adding set (1) or cleared (0) bits.
    - I.e must be one or the other, not all or none.
    - See also [Bitwise operation - XOR](https://en.wikipedia.org/wiki/Bitwise_operation#XOR).
- `>>=`: bitwise right shift
    - TODO: What and why (idc rn)?
- `<<=`: bitwise left shift
    - TODO: What and why (idc rn)?

## Comparison operators

- `>`: is greater than
    - `x > y`
    - Returns 1 (true) if `x` is greater than `y`.
- `<`: is less than
    - `x < y`
    - Returns 1 (true) if `x` is less than `y`.
- `==`: is equal to.
- `>=`: is greater than or equal to.
- `<=`: is less than or equal to.


## Logical operators

- `&&`: logical AND.
    - Returns 1 (true) if both statements are true.
- `||`: logical OR.
    - Returns 1 (true) if one of the statements is true.
- `!`: logical not.
    - Reverse the result, returns 1 if the result is 0.

## Sizeof operator

The memory size (in bytes) of a data type or a variable can be found  
with the `sizeof` operator.  
  
```c
// Example
int myNum = 42,
printf("%lu\n", sizeof(myNum));
```


## Data types

- `int`
    - 2 or 4 bytes.
    - Stores whole numbers, without decimals.
    - Uses `%d` or `%i` format specifier.
- `float`
    - 4 bytes.
    - Stores fractional numbers, containing one or more decimals.
    - Sufficient for storing 6-7 decimal digits.
    - Uses `%f` format specifier.
- `double`
    - Stores fractional numbers, containint one or more decimals.
    - Sufficient for storing 15 decimal digits.
    - Uses `%lf` format specifier.
- `char`
    - 1 byte.
    - Stores a single character/letter/number, or ASCII values.
    - Uses `%c` format specifier.
- TODO: Strings
    - Uses `%s` format specifier.
- `bool`
    - Boolean which only takes `true` or `false` values.
    - Must include `stdboo.h` header library.


## Decimal precision

Set decimal precision with a dot (`.`) followed by a number that  
specified how many digits should be shown after the decimal point.  
  
Example:  
```c
float myFloatNum = 3.5;

// Default will show 6 digits after the  decimal point
printf("%f\n", myFloatNum);
// Only show 1 digit
printf("%.1f\n", myFloatNum);
// Only show 2 digits
printf("%.2f\n", myFloatNum);
// Only show 4 digits
printf("%.4f", myFloatNum);
```

## Type conversion

Implicit type conversion happens automatically by the compiler when  
a value of one type to another.  
  
For example, assigning an `int` value to a `float` type will convert  
the number to a float, including the trailing 0's after the decimal  
point.  
  
The opposite also works. A `float` value assigned to an `int` type  
will lose the decimal values.  
  
Explicit conversion is done by manually placing the type in  
parenthesis `()` in front of the value.  
  
Example:  
```c
// Manual conversion: int to float
float sum = (float) 5 / 2;

printf("%f", sum); // 2.500000
```
  
## Constants

The `const` keyword can be used to declare variables that are to  
remain constant. These are unchangeable and read-only variables.  
  
```c
const int minutesPerHour = 60;
const float PI = 3.14;
```
  
It's a good practice to always declare a variable as a constant  
when the value is unlikely to change. Conventionally, constants are  
declared with uppercase for readability among C programmers.  
 
## Conditional statements

### if

Syntax:  
```c
if (condition) {
    // code to be executed if true.
}
```

### else

Syntax:  
```c
if (condition) {
    // code to be executed if true.
} else {
    // code to be executed if condition is false.
}
```

### else if

Syntax:  
```c
if (condition1) {
    // code to be executed if condition1 is true.
} else if (condition2) {
    // code to be executed if condition2 is true.
} else {
    // code to be executed if all conditions are false.
}
```

### if short hand

Also known as the ternary operator.  
  
Syntax:  
```c
variable = (condition) ? expressionTrue : expressionFalse;
```

### switch

- Alternative to writing many `if..else` statements.
- The `switch` expression is evaluated once.
- The value of the expression is completed with the values of each  
  `case`.
- The `break` statement breaks out of the switch block and stops the  
  execution.
- The `default` statement is optional, and specifies code to run if  
  there is no case match.
  
Syntax:  
```c
switch(expression) {
  case x:
    // code block
    break;
  case y:
    // code block
    break;
  default:
    // code block
}
```

Example:  
```c
int day = 4;

switch (day) {
  case 1:
    printf("Monday");
    break;
  case 2:
    printf("Tuesday");
    break;
  case 3:
    printf("Wednesday");
    break;
  case 4:
    printf("Thursday");
    break;
  case 5:
    printf("Friday");
    break;
  case 6:
    printf("Saturday");
    break;
  case 7:
    printf("Sunday");
    break;
}

// Outputs "Thursday" (day 4)
```

## Loops

### while

Syntax:  
```c
while (condition) {
    // code to be executed
}
```

### do while

- The loop is always executed at least once.
- Useful if condition depends on variable assignment inside the loop.
  
Syntax:  
```c
do {
    // code to be executed
}
while (condition);
```

### for



## References

- [W3 Schools - C Tutorial](https://www.w3schools.com/c/)
- [Wikipedia - C_(programming language)](https://en.wikipedia.org/wiki/C_(programming_language))
- [Wikipedia - Bitwise OR operation](https://en.wikipedia.org/wiki/Bitwise_operation#OR)
- [Wikipedia - Bitwise AND operation](https://en.wikipedia.org/wiki/Bitwise_operation#AND)
