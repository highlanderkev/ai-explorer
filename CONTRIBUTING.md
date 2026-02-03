# Contributing to AI Explorer

Thank you for your interest in contributing to AI Explorer! This document provides guidelines for contributing to the project.

## Code of Conduct

Please be respectful and constructive in all interactions. We aim to maintain a welcoming and inclusive environment.

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue with:
- A clear, descriptive title
- Steps to reproduce the issue
- Expected behavior
- Actual behavior
- Screenshots (if applicable)
- Your environment (Flutter version, OS, device)

### Suggesting Enhancements

Enhancement suggestions are welcome! Please open an issue with:
- A clear description of the enhancement
- Why this enhancement would be useful
- Possible implementation approaches
- Any relevant examples or mockups

### Pull Requests

1. **Fork the repository** and create your branch from `main`
2. **Make your changes** following the coding standards below
3. **Test your changes** thoroughly
4. **Update documentation** if needed
5. **Submit a pull request** with a clear description

## Development Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/highlanderkev/ai-explorer.git
   cd ai-explorer
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure Firebase (see SETUP.md)

4. Run the app:
   ```bash
   flutter run
   ```

## Coding Standards

### Dart Style
- Follow the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter analyze` to check for issues
- Format code with `dart format .`

### Code Organization
- Keep files focused and single-purpose
- Use clear, descriptive names for files, classes, and functions
- Organize imports: dart SDK, Flutter, external packages, internal files
- Group related functionality together

### Comments and Documentation
- Document public APIs with dartdoc comments
- Use inline comments for complex logic
- Keep comments up-to-date with code changes
- Avoid obvious comments

### Widget Best Practices
- Prefer `const` constructors when possible
- Extract widgets when they become complex
- Use composition over inheritance
- Keep widget trees readable with proper formatting

### State Management
- Keep state as local as possible
- Use StatefulWidget appropriately
- Consider using state management solutions for complex state

## Testing

### Running Tests
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

### Writing Tests
- Write tests for new features
- Update tests when modifying existing code
- Use descriptive test names
- Follow AAA pattern: Arrange, Act, Assert

## GenUI-Specific Guidelines

### Working with GenUI
- Understand the widget catalog system
- Test with various AI prompts
- Handle AI errors gracefully
- Validate AI outputs before rendering

### Firebase AI Integration
- Never commit real API keys
- Use environment variables for secrets
- Test with mock data when possible
- Monitor API usage and costs

## Commit Messages

Write clear, meaningful commit messages:

```
Brief summary (50 chars or less)

More detailed explanation if needed. Wrap at 72 characters.
Explain what and why, not how.

- Bullet points are fine
- Use present tense: "Add feature" not "Added feature"
- Reference issues: Fixes #123
```

Examples:
- ✅ `Add product card example to examples screen`
- ✅ `Fix Firebase initialization error handling`
- ✅ `Update README with setup instructions`
- ❌ `Updated stuff`
- ❌ `Fixed bug`

## Pull Request Process

1. **Update documentation** for any user-facing changes
2. **Add tests** for new features
3. **Ensure all tests pass** with `flutter test`
4. **Run the analyzer** with `flutter analyze`
5. **Format your code** with `dart format .`
6. **Update CHANGELOG.md** if applicable
7. **Request review** from maintainers

### PR Description Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
How did you test your changes?

## Screenshots
If applicable, add screenshots

## Checklist
- [ ] Code follows style guidelines
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] All tests pass
- [ ] No analyzer warnings
```

## Areas for Contribution

### High Priority
- More GenUI examples and use cases
- Better error handling
- Performance optimizations
- Additional widget catalog items
- Documentation improvements

### Feature Ideas
- Custom widget catalogs
- More complex AI interactions
- Theme customization
- Offline capabilities
- Example prompts library

### Documentation
- Tutorial videos
- Code examples
- Architecture diagrams
- API documentation
- Troubleshooting guides

## Questions?

If you have questions about contributing:
- Open a GitHub issue with the "question" label
- Check existing issues and discussions
- Review the documentation in README.md and SETUP.md

## License

By contributing, you agree that your contributions will be licensed under the same MIT License that covers the project.

---

Thank you for contributing to AI Explorer! 🎉
