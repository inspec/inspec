# Extending the Nginx Parser

Source: `lib/inspec/utils/nginx_parser.rb`
Test:   `test/unit/utils/nginx_parser_test.rb`
Consumer: `lib/inspec/resources/nginx_conf.rb`

---

## Architecture (3 classes, one pipeline)

```
Input string
  │
  ▼
NginxParser          Parslet PEG grammar → raw AST (hashes/arrays)
  │
  ▼
NginxTransform       Parslet tree transform → typed structs (Group, Exp)
  │
  ▼
NginxConfig.parse    Recursively converts structs → nested Ruby Hash
```

---

## How to add a new syntax rule

1. **Add a Parslet rule** in `NginxParser`:
   ```ruby
   rule(:my_new_construct) do
     # Parslet combinators here
   end
   ```
   Then reference it from an existing rule (usually `:exp` or `:value`).

2. **Add a transform rule** in `NginxTransform` (if the AST shape is new):
   ```ruby
   rule(my_tag: simple(:x)) { MyStruct.new(x.to_s) }
   ```

3. **Handle it in `NginxConfig.read_nginx_group`** (if it's not a plain directive or block).

4. **Write a test** — add an `it` block in the corresponding `describe` section:
   ```ruby
   it "parses my new construct" do
     result = parse("my_syntax value;")
     _(result[0][:assignment][:identifier]).must_equal "my_syntax"
   end
   ```

---

## Common extension scenarios

| Want to support... | Where to change |
|--------------------|-----------------|
| New directive syntax (e.g. `map $var $other { ... }`) | Add/modify `:section` rule args |
| New value type (e.g. variables `$foo`) | Add a rule under `:value` |
| New comment style | Modify `:comment` rule |
| Lua blocks (`content_by_lua_block { ... }`) | Add a dedicated rule (braces inside may confuse `:section`) |

---

## Testing workflow

```bash
# Fast iteration on the parser alone (~0.01s):
bundle exec ruby -Ilib:test test/unit/utils/nginx_parser_test.rb

# Validate the resource integration (~0.8s):
bundle exec ruby -Ilib:test test/unit/resources/nginx_conf_test.rb

# Both together:
bundle exec ruby -Ilib:test test/unit/utils/nginx_parser_test.rb \
  && bundle exec ruby -Ilib:test test/unit/resources/nginx_conf_test.rb
```

---

## Tips

- Use `NginxParser.new.parse(str)` in IRB to see the raw AST — helps debug new rules.
- Parslet errors point to the exact character offset where parsing failed.
- Keep rules small and composable; name them after the Nginx docs terminology.
- The `nginx_conf` resource test uses fixture files in `test/fixtures/` — add new fixtures there for complex configs.
