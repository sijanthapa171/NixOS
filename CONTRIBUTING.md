# Contributing to NixOS Configuration

Thank you for your interest in contributing to this NixOS configuration! This document provides guidelines and instructions for contributing.

## 📝 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Process](#development-process)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Commit Guidelines](#commit-guidelines)

## 🤝 Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment. We expect all contributors to:

- Be respectful of differing viewpoints and experiences
- Accept constructive criticism gracefully
- Focus on what's best for the community
- Show empathy towards other community members

## 🚀 Getting Started

1. **Fork the Repository**
   ```bash
   git clone https://github.com/authxt/NixOS.git
   cd NixOS
   ```

2. **Create a Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Test Your Changes**
   ```bash
   # Test your configuration
   nixos-rebuild test --flake .#Default
   ```

## 💻 Development Process

1. **Choose an Issue**
   - Look for issues labeled `good first issue` or `help wanted`
   - Comment on the issue to express your interest
   - Wait for assignment or confirmation

2. **Make Changes**
   - Keep changes focused and minimal
   - Follow the existing code style
   - Add comments where necessary
   - Update documentation as needed

3. **Test Your Changes**
   - Ensure all existing tests pass
   - Add new tests if needed
   - Test on multiple hardware configurations if possible

## 📤 Pull Request Process

1. **Update Documentation**
   - Update README.md if needed
   - Add/update configuration examples
   - Document new features or changes

2. **Create Pull Request**
   - Use a clear and descriptive title
   - Reference related issues
   - Provide detailed description of changes
   - Include screenshots if applicable

3. **Review Process**
   - Address review comments
   - Keep discussions focused
   - Be patient and respectful

## 📋 Coding Standards

### Nix Style Guide

- Use 2 spaces for indentation
- Keep lines under 120 characters
- Use meaningful variable names
- Comment complex configurations
- Follow the [Nixpkgs contribution guidelines](https://github.com/NixOS/nixpkgs/blob/master/CONTRIBUTING.md)

### Commit Messages

Format:
```
type(scope): description

[optional body]
[optional footer]
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Formatting changes
- `refactor`: Code restructuring
- `test`: Adding/updating tests
- `chore`: Maintenance tasks

Example:
```
feat(desktop): add KDE Plasma configuration

- Added basic KDE Plasma setup
- Configured default applications
- Added custom theme settings

Fixes #123
```

## 🔍 Review Checklist

Before submitting your PR, ensure:

- [ ] Code follows style guidelines
- [ ] Tests pass successfully
- [ ] Documentation is updated
- [ ] Commit messages are properly formatted
- [ ] Changes are rebased on latest main
- [ ] No conflicts with main branch

## 🙏 Thank You

Your contributions help make this project better for everyone. Thank you for your time and effort! 