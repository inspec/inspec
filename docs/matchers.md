# Matchers

## contain_match

Test if an array contains a matching element, which is identified by a regular expression.

```ruby
describe audit_daemon_rules do
  its("LIST_RULES") {should contain_match(/^exit,always arch=.* key=time-change syscall=adjtimex,settimeofday/) }
end
```

## contain_duplicates

Test if a list contains duplicate elements:

```ruby
describe etc_group do
  its(:gids) { should_not contain_duplicates }
end
```