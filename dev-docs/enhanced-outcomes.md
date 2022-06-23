# Enhanced Outcomes

Enhanced Outcomes refers to the addition of new control outcomes to the InSpec vocabulary.

## Test Outcomes vs. Control Outcomes

It is essential to understand that Enhanced Outcomes refers to new **control outcomes**, the results of running a control.

The results of running a test, a `describe block` are determined by RSpec and are limited to `Pass`, `Fail`, and `Skip`.

Test outcomes are much more difficult to extend than control outcomes.

## New Control Outcomes

Enhanced Outcomes adds three new control outcomes to the existing `Pass`, `Fail`, and `Skip` outcomes.

### Error

In the first iteration of Enhanced Outcomes, the Error outcome is detected:

 * if the message of any test includes the text "Control source error" OR
 * the result of any test includes a backtrace

Then the entire control should be marked `Error`.

Additional means of detecting error may be developed in the future.

Error's abbreviation is `ERR`. Error's UI color assignment is `Indigo`.

### Not Applicable

If the control is not in `Error` and the impact of the control is `0.0`, then the control's outcome is `Not Applicable`.

Not Applicable's abbreviation is `N/A`. Not Applicable's UI color assignment is `Sky Blue`.

### Not Reviewed

If the control is not in `Error` or `Not Applicable`, and all test results are `Skipped`, then the control outcome is `Not Reviewed`.

Not Reviewed replaces `Skipped` as a control outcome.

Not Reviewed's abbreviation is `N/R`. Not Reviewed's UI color assignment is `Amber`.

## The `--enhanced-outcomes` option

A new CLI option will be introduced for `inspec exec`, `inspec shell`, and `inspec schema` that controls the Enhanced Outcomes functionality.

### InSpec 5

In InSpec 5.x, a user must request the enhanced outcomes functionality explicitly by adding the `--enhanced-outcomes` option.

### InSpec 6

In InSpec 6.x, --enhanced-outcomes will default to `true`. A user may request disabling the enhanced outcomes functionality by adding the `--no-enhanced-outcomes` option.
