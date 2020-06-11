## v0.13.0

- Enhancement: Add support for Ruby 2.3 - [Oleksii Fedorov](https://github.com/waterlink) [#216](https://github.com/egonSchiele/contracts.ruby/pull/216)
- Enhancement: Added Int, Nat and NatPos builtin contracts - [Simon George](https://github.com/sfcgeorge) [#212](https://github.com/egonSchiele/contracts.ruby/pull/212)
- Bugfix: Allow contracts on singleton of subclass - [Oleksii Federov](https://github.com/waterlink) [#211](https://github.com/egonSchiele/contracts.ruby/pull/211)

## v0.12.0

- Feature: add `Regexp` validator - [Gert Goet](https://github.com/eval) [#196](https://github.com/egonSchiele/contracts.ruby/pull/196)
- Docs: bootstrap cucumber/aruba/relish setup - [Oleksii Fedorov](https://github.com/waterlink) [#195](https://github.com/egonSchiele/contracts.ruby/pull/195)
- Bugfix: allow to `extend` module, that has `Contracts` or `Contracts::Core` included without harming current module/class `Contracts` functionality, see: [#176](https://github.com/egonSchiele/contracts.ruby/issues/176) - [Oleksii Fedorov](https://github.com/waterlink) [#198](https://github.com/egonSchiele/contracts.ruby/pull/198)
- Enhancement: add `include Contracts::Builtin` to allow users to use builtin contracts without `Contracts::` prefix together with `include Contracts::Core` - [PikachuEXE](https://github.com/PikachuEXE) [#199](https://github.com/egonSchiele/contracts.ruby/pull/199)

## v0.11.0

- Enhancement: add `include Contracts::Core` that doesn't pollute the namespace as much as `include Contracts` - [Oleksii Federov](https://github.com/waterlink) [#185](https://github.com/egonSchiele/contracts.ruby/pull/185)
- Bugfix: fail if a non-hash is provided to a `HashOf` contract - [Abe Voelker](https://github.com/abevoelker) [#190](https://github.com/egonSchiele/contracts.ruby/pull/190)
- Bugfix: bugfix for using varargs and `Maybe[Proc]` together - [Adit Bhargava](https://github.com/egonSchiele) [#188](https://github.com/egonSchiele/contracts.ruby/pull/188)
- Bugfix: make KeywordArgs fail if unexpected keys are passed in - [Abe Voelker](https://github.com/abevoelker) [#187](https://github.com/egonSchiele/contracts.ruby/pull/187)
- Feature: range contract added - [Oleksii Fedorov](https://github.com/waterlink) [#184](https://github.com/egonSchiele/contracts.ruby/pull/184)
- Feature: enum contract added - [Dennis Günnewig](https://github.com/dg-ratiodata) [#181](https://github.com/egonSchiele/contracts.ruby/pull/181)

## v0.10.1

- Enhancement: make `@pattern_match` instance variable not render ruby warning. Required to use new aruba versions in rspec tests - [Dennis Günnewig](https://github.com/dg-ratiodata) [#179](https://github.com/egonSchiele/contracts.ruby/pull/179)

## v0.10

- Bugfix: make `Maybe[Proc]` work correctly - [Simon George](https://github.com/sfcgeorge) [#142](https://github.com/egonSchiele/contracts.ruby/pull/142)
- Bugfix: make `Func` contract verified when used as return contract - [Rob Rosenbaum](https://github.com/robnormal) [#145](https://github.com/egonSchiele/contracts.ruby/pull/145)
- Bugfix: make `Pos`, `Neg` and `Nat` contracts handle non-numeric values correctly - [Matt Griffin](https://github.com/betamatt) and [Gavin Sinclair](https://github.com/gsinclair) [#147](https://github.com/egonSchiele/contracts.ruby/pull/147) [#173](https://github.com/egonSchiele/contracts.ruby/pull/173)
- Enhancement: reduce user class pollution through introduction of contracts engine - [Oleksii Fedorov](https://github.com/waterlink) [#141](https://github.com/egonSchiele/contracts.ruby/pull/141)
- Feature: add builtin `KeywordArgs` and `Optional` contracts for keyword arguments handling - [Oleksii Fedorov](https://github.com/waterlink) [#151](https://github.com/egonSchiele/contracts.ruby/pull/151)
- Feature: recognize module as a class contract - [Oleksii Fedorov](https://github.com/waterlink) [#153](https://github.com/egonSchiele/contracts.ruby/pull/153)
- Feature: custom validators with `Contract.override_validator` - [Oleksii Fedorov](https://github.com/waterlink) [#159](https://github.com/egonSchiele/contracts.ruby/pull/159)
- Feature: add builtin `RangeOf[...]` contract - [Gavin Sinclair](https://github.com/gsinclair) [#171](https://github.com/egonSchiele/contracts.ruby/pull/171)

## v0.9

- MAJOR fix in pattern-matching: If the return contract for a pattern-matched function fails, it should NOT try the next pattern-match function. Pattern-matching is only for params, not return values.
- raise an error if multiple defns have the same contract for pattern matching.

- New syntax for functions with no input params (the old style still works)
  Old way:
  ```ruby
  Contract nil => 1
  def one
  ```
  New way:
  ```
  Contract 1
  def one
  ```

- Prettier HashOf contract can now be written like this: `HashOf[Num => String]`
- Add `SetOf` contract
- various small fixes

## v0.8

- code refactored (very slight loss of performance, big increase in readability)
- fail when defining a contract on a module without `include Contracts::Modules`
- fixed several bugs in argument parsing, functions with complex params get contracts applied correctly now.
- added rubocop to ci.
- if a contract is set on a protected method, it should not become public.
- fixed pattern matching when the multiple definitions of functions have different arities.
- couple of new built-in contracts: Nat, Eq.
- changed `Invariant` to `invariant`: `invariant(:day) { 1 <= day && day <= 31 }`
- prettier error messages (`Contracts::Num` is now just `Num`, for example)
- support for yard-contracts
