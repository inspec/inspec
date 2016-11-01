# InSpec documentation

This is the home of the InSpec documentation. This documentation provides an introduction to this mechanism and shows how to write custom tests.

The goal of this folder is for any community member to clone these docs, make the changes, check if they are valid, and contribute to the project.

## How to build docs

We build docs by:

1. Auto-generating docs from code
2. Transforming markdown+snippets in this folder into pure markdown in `www/source/docs`
3. Rendering them to the website via instructions in `www/`

For development, you **only need step 1**!

**1 Generate docs**

To generate all docs run:

```
bundle exec rake docs
```

You can run tasks individually. For a list of tasks run:

```
bundle exec rake --tasks docs
```

## Stability Index

Every available InSpec resource will indicate its stability. As InSpec matures, certain parts are more reliable than others. Brand new features are likely to be redesigned and marked as such.

The stability indices are as follows:

* `Stability: Deprecated` - This features will be removed in future versions, because its known for being problematic. Do not rely on it.
* `Stability: Experimental` - New features may change or are removed in future versions
* `Stability: Stable` - API is well established and proofed. Maintaining compatibility is a high priority
* `Stability: Locked` - Only security and performance fixes are allowed
