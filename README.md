# Total Machine

A calculator application for fast additions of single digit numbers (and multidigit & fractions too).

Useful while 

## Building

Run `./build.sh` to build.

It loads appropriate files into sbcl and calls `save-lisp-and-die` from `sb-ext` package to make `machine` executable.

## Use

Run `./machine` to use.

Read examples for more examples.

## Examples

(using `$` here to represent the prompt, which is a `[1]` in the program, number updates every use)

### Basic

```
$ 74
11
```

explanation: 7 + 4 = 11

```
$ 1234567890
45
```

### Fractions

explanation: 1 + 2 + ... + 9 + 0 = 45

```
$ .
0 1/2
```

explanation: `.` is short for 0.5

```
$ 4.2
6 1/2
```

explanation: 4 + 2 + 0.5 = 6.5

```
$ 12.34..
11 1/2
```

explantion: 1 + 2 + 0.5 + 3 + 4 + 0.5 + 0.5 = 11.5

### Multidigit mode

```
$/12/
12
```

explanation: `/` opens and closes multidigit mode (no need to close, if `/` is the last character)

```
$/12/23/34/
51
```

explanation: 12 + 2 + 3 + 34 = 51

```
$/1.2/2.3/3.4/
51 1/2
```

explanation: 12 + 2 + 0.5 + 3 + 34 = 51.5 (fractions do not work in multidigit mode)

### Commands

`q`, `quit`, `exit` to leave.

`set index 5` to set prompt to 5.

## TODO

 - Improve code for command management, make it easier to add more commands. (`command-management.lisp`)
 - Add more commands.
 - Use build system like ASDF.
 - Use quicklisp.