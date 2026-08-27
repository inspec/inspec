# Updating Gemfile.lock

This guide explains how to properly update `Gemfile.lock` to ensure consistency between local development and CI environments.

## The Problem

Using random or mismatched Bundler versions can lead to:
- Inconsistent dependency resolution between developers
- CI failures due to version mismatches
- Unexpected `Gemfile.lock` changes during version checks
- Different behavior between `bundle` and `bundler` commands

## The Solution: Align with CI

To ensure your local environment matches CI, follow these steps:

### 1. Update RubyGems to Match CI

Instead of installing arbitrary Bundler versions, update RubyGems which includes the appropriate Bundler version:

```bash
gem update --system
```

This ensures you get the correct Bundler version that ships with the compatible RubyGems version for your Ruby installation.

### 2. Verify Versions

Check your current versions:

```bash
gem --version
bundler --version
```

Compare with what's in `Gemfile.lock`:

```bash
tail -5 Gemfile.lock
# Look for the BUNDLED WITH section
```

### 3. Run Bundle Install

Once versions are aligned, run:

```bash
bundle install
```

This will work similarly to CI and avoid unexpected `Gemfile.lock` modifications.

## Understanding Bundler vs Bundle Commands

- **`bundle -v`**: Shows version without modifying `Gemfile.lock` ✅
- **`bundler -v`**: May trigger dependency resolution and create/modify `Gemfile.lock` ❌

**Recommendation**: Always use `bundle` (without the 'r') for version checks.

## Version Compatibility

### Ruby 3.1.7
- Minimum RubyGems: 3.3.3
- Recommended RubyGems: 3.3.27
- Default Bundler: 2.3.27

### Bundler 2.3.x vs 2.5.x Behavior

**Bundler 2.3.x and earlier:**
- Does not show duplicate gem warnings
- Minimal dependency resolution on `-v` check

**Bundler 2.5.x and later:**
- Enhanced Gemfile validation
- Detects duplicate gem sources
- May create `Gemfile.lock` during version checks

## Common Issues

### Issue: `bundler -v` Creates Gemfile.lock

**Symptom**: Running `bundler -v` unexpectedly creates or modifies `Gemfile.lock`

**Cause**: Bundler 2.3+ validates Gemfile structure (including duplicate gem detection) even for version checks

**Solution**: Use `bundle -v` instead of `bundler -v`

### Issue: Different Versions Between Local and Gemfile.lock

**Symptom**: `Gemfile.lock` says `BUNDLED WITH 2.3.3` but `bundler -v` shows different version

**Cause**: RubyGems default bundler version doesn't match lock file

**Solution**:
```bash
# Option 1: Update RubyGems to get matching Bundler
gem update --system 3.3.3  # Includes bundler 2.3.3
```

### Issue: Duplicate Gem Warnings

**Symptom**: Warning about gems found in multiple sources (e.g., `inspec-core-bin`)

**Cause**: InSpec's multi-gem structure has gems in multiple path sources (intentional for packaging)

**Solution**: This is expected behavior for InSpec. The warning can be safely ignored or suppressed by using Bundler 2.2.3 or earlier.

## Best Practices

1. **Always use `gem update --system`** to update Bundler instead of `gem install bundler -v X.X.X`
2. **Use `bundle` command** instead of `bundler` for operations
3. **Check versions match** between local and `Gemfile.lock` before committing
4. **Don't manually edit** the `BUNDLED WITH` section in `Gemfile.lock`
5. **Run `bundle install`** after pulling changes to sync dependencies

## CI Alignment Checklist

Before committing `Gemfile.lock` changes:

- [ ] RubyGems version matches CI requirements
- [ ] `bundle install` completes successfully
- [ ] `BUNDLED WITH` version in `Gemfile.lock` is consistent
- [ ] No unexpected gem version changes
- [ ] Tests pass locally

## References

- [Bundler Documentation](https://bundler.io/docs.html)
- [RubyGems Guides](https://guides.rubygems.org/)
- InSpec CI configuration: `.github/workflows/`
