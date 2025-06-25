<div align="center">

# asdf-clang-format-pypi

[clang-format](https://pypi.org/project/clang-format/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Dependencies

- `bash`, `python3` with `pip`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).

# Install

Plugin:

```shell
asdf plugin add clang-format
# or
asdf plugin add clang-format https://github.com/adamtuft/asdf-clang-format-pypi.git
```

clang-format:

```shell
# Show all installable versions
asdf list-all clang-format

# Install specific version
asdf install clang-format latest

# Set a version globally (on your ~/.tool-versions file)
asdf global clang-format latest

# Now clang-format is available
clang-format --version
```

Check the [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/adamtuft/asdf-clang-format-pypi/graphs/contributors)!

# License

See [LICENSE](LICENSE)

Copyright [Adam Tuft](https://github.com/adamtuft/), 2025
