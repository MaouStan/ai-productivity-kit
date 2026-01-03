# Python Patterns

**Source**: https://python.org
**Learned**: 2026-01-03
**Type**: Reusable Pattern

---

## Overview

Common Python patterns for writing clean, idiomatic code. These patterns help you write Python code that feels natural and readable.

## The Patterns

### List Comprehension Pattern

**Structure**:
```python
[expression for item in iterable if condition]
```

**Components**:

| Component | Purpose |
|-----------|---------|
| `expression` | Value to add to result list |
| `item` | Variable for each element |
| `iterable` | Source collection |
| `condition` (optional) | Filter for items |

**When to Use**:
✅ **Good for**:
- Transforming list elements
- Filtering lists
- Creating new lists from existing data

❌ **Avoid for**:
- Very complex transformations (use function instead)
- Side effects during iteration

### For-Loop Sum Pattern

**Structure**:
```python
total = 0
for num in numbers:
    total = total + num
print("Sum:", total)
```

**Components**:

| Component | Purpose |
|-----------|---------|
| `total` | Accumulator variable |
| `for num in numbers` | Iterate over sequence |
| `total = total + num` | Add each item to total |

**When to Use**:
✅ **Good for**:
- Learning iteration
- Simple aggregations

❌ **Better alternative**:
- Use `sum()` function for simple sums
- Use comprehensions for transformations

### Function Definition Pattern

**Structure**:
```python
def fib(n):
    a, b = 0, 1
    while a < n:
        print(a, end=' ')
        a, b = b, a+b
    print()
```

**Components**:

| Component | Purpose |
|-----------|---------|
| `def fib(n):` | Function name and parameter |
| `a, b = 0, 1` | Initialize state |
| `while a < n:` | Loop condition |
| `a, b = b, a+b` | State update (tuple unpacking) |

**When to Use**:
✅ **Good for**:
- Reusable logic
- Sequences and series

### Range Pattern

**Structure**:
```python
range(start, stop, step)
# or
range(stop)  # starts at 0
```

**Examples**:
```python
>>> list(range(5))
[0, 1, 2, 3, 4]

>>> list(range(2, 6))
[2, 3, 4, 5]

>>> list(range(0, 10, 2))
[0, 2, 4, 6, 8]
```

## Implementation Steps

### Using List Comprehension

1. **Identify source list**
   ```python
   fruits = ['apple', 'banana', 'cherry']
   ```

2. **Define transformation**
   ```python
   loud_fruits = [fruit.upper() for fruit in fruits]
   ```

3. **Add filter (optional)**
   ```python
   long_fruits = [f for f in fruits if len(f) > 5]
   ```

### Using Enumerate

1. **Call enumerate on list**
   ```python
   list(enumerate(['a', 'b', 'c']))
   ```

2. **Get index-value pairs**
   ```python
   [(0, 'a'), (1, 'b'), (2, 'c')]
   ```

## Variations

### Variation 1: Dictionary Comprehension
```python
{name: len(name) for name in fruits}
# {'apple': 5, 'banana': 6, 'cherry': 6}
```

### Variation 2: Set Comprehension
```python
{char for char in 'hello'}
# {'h', 'e', 'l', 'o'}
```

### Variation 3: Generator Expression
```python
sum(x*x for x in range(10))
# Lazy evaluation, memory efficient
```

## Related Patterns

- **Map-Filter-Reduce**: Functional programming patterns
- **Generator functions**: For lazy sequences
- **Decorator pattern**: For function modification

## See Also

- [Python Concepts](concepts/python-concepts.md)
- [Python Reference](refs/python-reference.md)

---

**Tags**: python, patterns, idiomatic, comprehension
**Last Updated**: 2026-01-03
