# python-workflow

**Workflow for common Python tasks**
*Auto-generated from learning https://python.org*

## When to Use

When working with Python data structures, transformations, or basic scripting tasks.

## Steps

### 1. Process a List with Comprehension

```python
# Start with source data
fruits = ['Banana', 'Apple', 'Strawberry']

# Transform each element
loud_fruits = [fruit.upper() for fruit in fruits]

print(loud_fruits)  # ['BANANA', 'APPLE', 'STRAWBERRY']
```

### 2. Filter a List

```python
# Keep only items matching condition
long_fruits = [f for f in fruits if len(f) > 5]
print(long_fruits)  # ['Banana', 'Strawberry']
```

### 3. Sum Values in a List

```python
numbers = [2, 4, 6, 8]

# Method 1: Using sum()
total = sum(numbers)
print(total)  # 20

# Method 2: Manual loop
total = 0
for num in numbers:
    total = total + num
print(total)  # 20
```

### 4. Iterate with Index

```python
fruits = ['Banana', 'Apple', 'Strawberry']

# Using enumerate
for index, fruit in enumerate(fruits):
    print(f"{index}: {fruit}")
# Output:
# 0: Banana
# 1: Apple
# 2: Strawberry
```

### 5. Define and Use Functions

```python
def fib(n):
    """Print Fibonacci series up to n"""
    a, b = 0, 1
    while a < n:
        print(a, end=' ')
        a, b = b, a+b
    print()

fib(100)  # 0 1 1 2 3 5 8 13 21 34 55 89
```

## Example

```python
# Complete example: Process and display data

def analyze_scores(scores):
    """Calculate statistics from a list of scores"""
    if not scores:
        return "No scores provided"

    total = sum(scores)
    average = total / len(scores)
    passing = [s for s in scores if s >= 60]

    return {
        'total': total,
        'average': average,
        'passing_count': len(passing),
        'passing_scores': passing
    }

# Usage
scores = [85, 92, 78, 45, 67, 88]
result = analyze_scores(scores)
print(f"Average: {result['average']:.1f}")
print(f"Passing: {result['passing_count']}")
```

## Common Pitfalls

- **Modifying list while iterating**: Create a new list instead
- **Using `list` as variable name**: Shadows built-in `list()` function
- **Forgetting `:` after if/for/def**: Syntax error
- **Inconsistent indentation**: Use 4 spaces consistently

## Related

- [Python Concepts](../../ψ/memory/concepts/python-concepts.md)
- [Python Patterns](../../ψ/memory/patterns/python-patterns.md)
- [Python Reference](../../ψ/memory/refs/python-reference.md)

---

**Auto-generated**: 2026-01-03
**Source**: https://python.org
