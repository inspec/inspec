# Extending the `ini` Resource

A short guide for contributors who want to add behaviour to
`lib/inspec/resources/ini.rb` without breaking existing profiles.

---

## 1. How the resource is built

```
IniConfig  (lib/inspec/resources/ini.rb)
    └── JsonConfig  (lib/inspec/resources/json.rb)
            └── Inspec.resource(1)
                    └── ObjectTraverser  (lib/inspec/utils/object_traversal.rb)
```

`IniConfig` overrides exactly **two methods** from `JsonConfig`:

| Method | Purpose |
|--------|---------|
| `parse(content)` | Swaps `JSON.parse` for `SimpleConfig.new(content).params` |
| `resource_base_name` | Returns `"INI"` — used in `to_s` and `resource_id` labels |

Everything else — `params`, `value`, `resource_id`, `to_s`, source loading
(file / content / command) — is inherited unchanged from `JsonConfig`.

---

## 2. Adding a new public method

Override in `IniConfig` and delegate to `params` (already a clean nested Hash):

```ruby
# Returns all keys defined under a given section, or [] if the section
# does not exist.
def section_keys(section)
  params.fetch(section, {}).keys
end
```

Add a fixture line to `test/fixtures/files/rootwrap.conf` if you need a new
INI shape, then add a test in `test/unit/resources/ini_test.rb`:

```ruby
it "lists keys for an existing section" do
  _(resource.section_keys("DEFAULT")).must_include "exec_dirs"
end

it "returns empty array for a missing section" do
  _(resource.section_keys("MISSING")).must_equal []
end
```

---

## 3. Changing the parser

`SimpleConfig` is InSpec's own lightweight INI parser
(`lib/inspec/utils/simpleconfig.rb`). If you need a behaviour change
(e.g. multi-value keys, quoted strings), edit `SimpleConfig` — not `parse`.

`parse` must always return a `Hash`; `JsonConfig` passes its return value
directly to `ObjectTraverser`.

---

## 4. Adding a new fixture file

1. Drop the file in `test/fixtures/files/<name>.ini`.
2. Register it in `test/helpers/mock_loader.rb`:
   ```ruby
   "<name>.ini" => mockfile.call("<name>.ini"),
   ```
3. Load it in your test:
   ```ruby
   let(:resource) { MockLoader.new(:ubuntu).load_resource("ini", "<name>.ini") }
   ```

---

## 5. Dependency considerations

The only external gem in the `ini` parse path is **`parslet`** (via `SimpleConfig`).

| Gem | Gemspec constraint | Resolved | Safe to bump? |
|-----|--------------------|----------|---------------|
| `parslet` | `>= 1.5, < 3.0` | 2.0.0 | Minor bumps within 2.x only — API changed at 3.x |
| `hashie` | `>= 3.4, < 6.0` | 5.1.0 | Safe within 5.x |
| `train-core` | `~> 3.16` | 3.16.1 | Minor bumps safe; major needs transport-API audit |

`SimpleConfig` and `CommentParser` are vendored inside InSpec (`lib/inspec/utils/`) —
they have no external gem of their own.

See [`dependency-notes.md`](./dependency-notes.md) for the full project-wide analysis.

## 6. What NOT to change

| Item | Reason |
|------|--------|
| `resource_base_name` return value `"INI"` | Changing it breaks existing `to_s` / `resource_id` assertions in profiles |
| Method signature of `parse(content)` | Fixed by `JsonConfig`; adding parameters breaks the call chain |
| `supports platform: "os"` | Removing it would silently skip the resource on all platforms |

---

## 6. Run tests after every change

```bash
# Fast: just this resource
bundle exec ruby -Ilib -Itest test/unit/resources/ini_test.rb

# Broader safety net
bundle exec rake test:unit
```

Expected baseline: **3 runs, 5 assertions, 0 failures, 0 errors, 0 skips**
(increases as you add tests).
