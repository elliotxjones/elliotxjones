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

{{{

Syntax:  
```c
#include <stdio.h>
```
  
- `stdio.h`
    - Provides support for output functions, such as `printf()`.
- `stdbool.h`
    - Provides support for booleans; `bool` with `true` or `false`  
      keywords.
- `<string.h>`
    - Provides support for string functions, which can be used to  
      perform certain operations on strings.
}}}

## Rules

{{{
- All programs must have `main()`.
- Every statement must end with semicolon `;`.

}}}

## Escape characters

{{{
- `\n`: newline.
- `\t`: tab.
- `\"`: double quote character.
- `\'`: Single quote.
- `\\`: Backslash.
- `\0`: Null.
}}}

## Comments

{{{
```c
// single line comment.

/*
Multi-line
comment.
*/
```
}}}

## Variable types

{{{
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

}}}

## printf

{{{

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
}}}

## Arithmatic operators

{{{
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

}}}

## Assignment operators

{{{
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
}}}

## Comparison operators

{{{
- `>`: is greater than
    - `x > y`
    - Returns 1 (true) if `x` is greater than `y`.
- `<`: is less than
    - `x < y`
    - Returns 1 (true) if `x` is less than `y`.
- `==`: is equal to.
- `>=`: is greater than or equal to.
- `<=`: is less than or equal to.
}}}

## Logical operators

{{{
- `&&`: logical AND.
    - Returns 1 (true) if both statements are true.
- `||`: logical OR.
    - Returns 1 (true) if one of the statements is true.
- `!`: logical not.
    - Reverse the result, returns 1 if the result is 0.
}}}

## Sizeof operator

{{{
The memory size (in bytes) of a data type or a variable can be found  
with the `sizeof` operator.  
  
```c
// Example
int myNum = 42,
printf("%lu\n", sizeof(myNum));
```
}}}

## Data types

{{{

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
}}}

## Decimal precision

{{{
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
}}}

## Type conversion

{{{
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
}}}
  
## Constants

{{{

The `const` keyword can be used to declare variables that are to  
remain constant. These are unchangeable and read-only variables.  
  
```c
const int minutesPerHour = 60;
const float PI = 3.14;
```
  
It's a good practice to always declare a variable as a constant  
when the value is unlikely to change. Conventionally, constants are  
declared with uppercase for readability among C programmers.  
 
}}}

## Conditional statements

{{{

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
}}}

## Loops

{{{
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

### for loop

Sytax:  
  
```c
for (statement 1; statement 2; statement 3) {
    // code to be executed.
}
```
  
Example:  
  
```c
int i;

for (i = 0; i < 5; i++) {
  printf("%d\n", i);
}
```
}}}

## Break and continue

{{{
- `break` is used to "break out of" a loop or switch statement.  
- `continue` is used to break one iteration of the loop and continue  
  with the next iteration.

Examples:

```c
int i;

for (i = 0; i < 10; i++) {
  if (i == 4) {
    continue;
  }
  printf("%d\n", i);
}
```
}}}

## Arrays

{{{

### Basics

- Arrays are used to store multiple values in a single variable.  
- An array is defined with the type (e.g. `int`).
- Items in the array can be accessed by referencing the index number  
  of the item.
    - Index numbers are positional values refering to the items in  
      the array and starts with 0 for the first item.
  
Example:  
```c
int myNumbers[] = {25, 50, 75, 100};
printf("%d", myNumbers[0]);
// Outputs 25
```

### Array size 

Another common way to create arrays, is to specify the size of the  
array, and add elements later.  
  
Example:  

```c
// Declare an array of four integers:
int myNumbers[4];

// Add elements
myNumbers[0] = 25;
myNumbers[1] = 50;
myNumbers[2] = 75;
myNumbers[3] = 100;
```

### 2D array.

- Also know as a matrix (a table or rows and columns).

Example:  

```c
int matrix[2][3] = { {1, 4, 2}, {3, 6, 8} };
```

To access elements of a 2-D array, you must specify the index numer  
of both the row and column.  
  
The following example accesses the value of the element in the first  
row and third column of the matrix array.  
  
```c
int matrix[2][3] = { {1, 4, 2}, {3, 6, 8} };

printf("%d", matrix[0][2]);  // Outputs 2 
```

To change the value of an element, refer to the index number of the  
element in each of the dimensions.  
  
Example:  

```c
int matrix[2][3] = { {1, 4, 2}, {3, 6, 8} };
matrix[0][0] = 9;

printf("%d", matrix[0][0]);  // Now outputs 9 instead of 1 
```

To loop through a multi-dimensional array, you need one loop for each  
of the dimensions in the array.  
  
Example:  

```c
int matrix[2][3] = { {1, 4, 2}, {3, 6, 8} };

int i, j;
for (i = 0; i < 2; i++) {
  for (j = 0; j < 3; j++) {
    printf("%d\n", matrix[i][j]);
  }
} 
```
}}}

## Strings

{{{ 

Unlike many other programming languages, C does not have a String  
type to easily create string variables. Instead, you must use the  
char type and create an array of characters to make a string in C.  
  
Example:  

```c
char greetings[] = "Hello World!";
```
- Strings must use double quotes.
- Can be used with `printf` along with the `%s` format specifier.
- Can use escape character to store special characters.

}}}

### Builtin string functions

{{{
C also has many useful string functions, which can be used to  
perform certain operations on strings.  
  
To use them, you must include the `<string.h>` header file in your  
program.  
 
- `strlen()`
    - Gets the length of a string. 
- `strcat()`
    - Concatenates two strings.
    - Syntax: `strcat(str1, str2);`
        - Result is stored in str1.
- `strcopy()`
    - Copies the value of one string to another.
    - Syntax: `strcopy(str2, str1);`
        - `str2` should be large enough to store the copied string.
- `strcmp()`
    - Compares two strings and returns 0 is both are equal,  
      otherwise a value that is not 0.

}}}

## User input

`scanf()` is used to get user input.  
  
Example:

```c
// Create an integer variable that will store the number we get from  
// the user
int myNum;

// Ask the user to type a number
printf("Type a number: \n");

// Get and save the number the user types
scanf("%d", &myNum);

// Output the number the user typed
printf("Your number is: %d", myNum);
```
  
`scanf()` also allows for multiple inputs.  
  
The following example take an integer and character input.  
  
Example:  

```c
// Create an int and a char variable
int myNum;
char myChar;

// Ask the user to type a number AND a character
printf("Type a number AND a character and press enter: \n");

// Get and save the number AND character the user types
scanf("%d %c", &myNum, &myChar);

// Print the number
printf("Your number is: %d\n", myNum);

// Print the character
printf("Your character is: %c\n", myChar);

```

`scanf()` can also get a string entered by the user.  
 
Example:  

```c
// Create a string.
char firstName[30];

// Ask the user to input some text
printf("Enter your first name: \n");

// Get and save the text
scanf("%s", firstName);

// Output the text
printf("Hello %s", firstName);
```

## Memory address

When a variable is created in C, a memory address is assigned to one  
variable. The memory address is the location of where the variable is  
stored on the computer.  
  
To access it, he reference operator (`&`) is used 


## References

- [W3 Schools - C Tutorial](https://www.w3schools.com/c/)
- [Wikipedia - C_(programming language)](https://en.wikipedia.org/wiki/C_(programming_language))
- [Wikipedia - Bitwise OR operation](https://en.wikipedia.org/wiki/Bitwise_operation#OR)
- [Wikipedia - Bitwise AND operati
on](https://en.wikipedia.org/wiki/Bitwise_operation#AND)
