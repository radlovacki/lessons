# Приоритет оператора

| Оператор                                                                                                                                                             | Категорија                                 |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------|
| `x.y`, `f(x)`, `a[i]`, `x?.y`, `x?[y]`, `x++`, `x--`, `x!`, `new`, `typeof`, `checked`, `unchecked`, `default`, `nameof`, `delegate`, `sizeof`, `stackalloc`, `x->y` | Primary                                    |
| `+x`, `-x`, `!x`, `~x`, `++x`, `--x`, `^x`, `(T)x`, `await`, `&x`, `*x`, `true` and `false`                                                                          | Unary                                      |
| `x..y`                                                                                                                                                               | Range                                      |
| `switch`, `with`                                                                                                                                                     | switch and with expressions                |
| `x * y`, `x / y`, `x % y`                                                                                                                                            | Multiplicative                             |
| `x + y`, `x – y`                                                                                                                                                     | Additive                                   |
| `x << y`, `x >> y`, `x >>> y`                                                                                                                                        | Shift                                      |
| `x < y`, `x > y`, `x <= y`, `x >= y`, `is`, `as`                                                                                                                     | Relational and type-testing                |
| `x == y`, `x != y`                                                                                                                                                   | Equality                                   |
| `x & y`                                                                                                                                                              | Boolean logical AND or bitwise logical AND |
| `x ^ y`                                                                                                                                                              | Boolean logical XOR or bitwise logical XOR |
| `x \| y`                                                                                                                                                             | Boolean logical OR or bitwise logical OR   |
| `x && y`                                                                                                                                                             | Conditional AND                            |
| `x \|\| y`                                                                                                                                                           | Conditional OR                             |
| `x ?? y`                                                                                                                                                             | Null-coalescing operator                   |
| `c ? t : f`                                                                                                                                                          | Conditional operator                       |
| `x = y`, `x += y`, `x -= y`, `x *= y`, `x /= y`, `x %= y`, `x &= y`, `x \|= y`, `x ^= y`, `x <<= y`, `x >>= y`, `x >>>= y`, `x ??= y`, `=>`                          | Assignment and lambda declaration          |
