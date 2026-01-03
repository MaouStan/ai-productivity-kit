# Python Quick Reference

**Source**: https://python.org
**Learned**: 2026-01-03
**Type**: Quick Reference

---

## Quick Operators

| Operator | Description | Example |
|---------|-------------|---------|
| `+` | Addition | `1 + 2 = 3` |
| `-` | Subtraction | `5 - 3 = 2` |
| `*` | Multiplication | `2 * 3 = 6` |
| `/` | Division (float) | `7 / 2 = 3.5` |
| `//` | Floor division | `7 // 2 = 3` |
| `**` | Exponent | `2 ** 3 = 8` |
| `%` | Modulo | `7 % 3 = 1` |

## List Operations

| Method | Description | Example |
|--------|-------------|---------|
| `len(x)` | Get length | `len([1,2,3]) = 3` |
| `x.append(v)` | Add value | `x.append(4)` |
| `x.extend(y)` | Extend list | `x.extend([5,6])` |
| `x[i]` | Index access | `x[0]` |
| `x[start:stop]` | Slice | `x[1:3]` |
| `[f(x) for x in y]` | Comprehension | `[n*2 for n in nums]` |
| `enumerate(x)` | Get index pairs | `list(enumerate(['a','b']))` |

## String Operations

| Method | Parameters | Returns | Description |
|------|------------|---------|-------------|
| `str.upper()` | none | Uppercase string | Convert to uppercase |
| `str.lower()` | none | Lowercase string | Convert to lowercase |
| `str.strip()` | none | Whitespace removed | Remove leading/trailing space |
| `str.replace(a,b)` | old, new | Modified string | Replace occurrences |
| `str.split()` | sep (optional) | List of parts | Split into list |

## Built-in Functions

| Function | Parameters | Returns | Description |
|----------|------------|---------|-------------|
| `print()` | *args, sep=' ', end='\n' | None | Output to console |
| `input()` | prompt | String | Get user input |
| `len()` | iterable | Int | Get length |
| `range()` | start, stop, step | Range object | Generate numbers |
| `sum()` | iterable | Number | Sum values |
| `enumerate()` | iterable | Enum object | Index-value pairs |
| `type()` | object | Type | Get type |

## Control Flow

```
if condition:
    statement
elif other:
    statement
else:
    statement

for item in iterable:
    statement

while condition:
    statement
```

## Common Tasks

### Create a list of numbers

```python
>>> list(range(5))
[0, 1, 2, 3, 4]
```

### Transform each item in a list

```python
>>> fruits = ['apple', 'banana']
>>> [f.upper() for f in fruits]
['APPLE', 'BANANA']
```

### Sum numbers in a list

```python
>>> nums = [2, 4, 6, 8]
>>> sum(nums)
20
```

### Define a function

```python
def greet(name):
    return f"Hello, {name}!"

>>> greet("World")
'Hello, World!'
```

### Loop with index

```python
>>> fruits = ['apple', 'banana', 'cherry']
>>> for i, fruit in enumerate(fruits):
>>>     print(f"{i}: {fruit}")
0: apple
1: banana
2: cherry
```

## Data Type Conversions

| To | Function | Example |
|----|----------|---------|
| String | `str(x)` | `str(42)` = `"42"` |
| Integer | `int(x)` | `int("42")` = `42` |
| Float | `float(x)` | `float("3.14")` = `3.14` |
| List | `list(x)` | `list("abc")` = `['a','b','c']` |

## Comment Syntax

```python
# Single line comment

"""
Multi-line
comment/docstring
"""
```

## Troubleshooting

| Problem | Solution |
|---------|----------|
| `IndentationError` | Check consistent spacing (4 spaces recommended) |
| `NameError` | Variable used before definition |
| `TypeError` | Wrong type for operation |
| `IndexError` | List index out of range |
| `KeyError` | Dictionary key not found |

---

**Tags**: python, reference, quick-start
**Last Updated**: 2026-01-03
