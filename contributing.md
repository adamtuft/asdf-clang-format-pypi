# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

asdf plugin test asdf-clang-format-pypi https://github.com/adamtuft/asdf-clang-format-pypi.git "clang-format --version"
```

Tests are automatically run in GitHub Actions on push and PR.
