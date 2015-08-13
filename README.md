# Distillery
A small ruby script to help filter log files.

## Example

This script tries to handle multiline logs effectively by grouping logs by a common prefix.

Take this log for example:

```
Aug 14 18:45:01 Uninteresting log line
Aug 14 18:45:01 MyApp - Sending request
Aug 14 18:45:01 Overly verbose third part library logs...
Aug 14 18:45:02 MyApp - Received JSON response: 
  {
    "name": "John Smith",
    "age": 47
  }
Aug 14 18:45:02 More random info...
```

If you want to extract all the lines that contain ``MyApp`` but also wanted to keep the multiline content associated with line 4 you could run this: ``distillery --input input.log --prefix "[A-Za-z]{3} \d{2}" --filter "MyApp"``

Output: 

```
Aug 14 18:45:01 MyApp - Sending request
Aug 14 18:45:02 MyApp - Received JSON response: 
  {
    "name": "John Smith",
    "age": 47
  }
```


## Usage

```
$ distillery
Usage: distillery [options]
    -i, --input PATH                 Input Path
    -o, --output PATH                Output Path
    -p, --prefix REGEXP              Line Prefix Format
    -f, --filter REGEXP              Filter
    -v, --verbose                    Verbose
    -h, --help                       Displays Help
```


