# Kattis-Output-Checker
Downloads, extracts, and compares Kattis sample answers with the output of your program.
## Requirements
* Windows Operating System
* 7-Zip downloaded and the executable for it in your PATH environment variable (<https://www.7-zip.org/>)

See <https://medium.com/@kevinmarkvi/how-to-add-executables-to-your-path-in-windows-5ffa4ce61a53> for adding an executable to your system's PATH variable.

## How To Use
I recommend adding the `kattis-check.bat` file to your PATH variable for ease of use.

The batch script can used as follows:
```
kattis-check.bat <problem-tag> <path/to/program/executable>
```
The `problem-tag` is the "Problem ID" that Kattis assigned to the problem. This can be found on the right-hand side of the problem description, in the same area where CPU time limit and memory limit are given.

The `<path/to/program/executable>` is the relative or absolute path to the executable that is created when your code is compiled. If you are using an IDE to write your code, it will located somewhere in the project file, probably in bin\Debug (at least for CodeBlocks).

## Intepreting The Results
Upon running the script the terminal will flash red or green, indicating whether all test cases passed or not. Test cases that failed will display a side-by-side comparison of differences between your output and the sample answers.

**NOTE**: not ending your input with a newline will likely cause the sample test cases the fail, even though your program will still be accepted by Kattis when you submit it.
