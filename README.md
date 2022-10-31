# protoize

Once upon a time, GCC included a utility (`protoize`) to convert legacy K&R-style function declarations to the newer ANSI C style.

This is very useful in converting legacy code bases written prior to ANSI C.

However, the utility was removed in GCC 4.5 (released April 2010). The justification is that very few people need to do that any more.

That's true, but there are a few of us who still like to dabble in really old stuff.

Hence, this Docker container, which uses an old version of Debian to run `protoize` from GCC 4.4.

## Usage

```
./protoize /path/to/oldfile.c
```

It will copy `oldfile.c` to `./work/oldfile.c`, and convert it in-place from K&R to ANSI.

If you are happy with the results, you can just copy it back.
