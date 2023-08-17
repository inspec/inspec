+++
title = "InSpec Parallel"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "InSpec Parallel"
    identifier = "inspec/parallel.md InSpec Parallel"
    parent = "inspec"
    weight = 25
+++

Chef InSpec Parallel can automatically manage multiple profile executions in parallel on a system targeting several remote systems and environments.
It manages multiple processes, their status updates, their exit codes, and user updates.
All target operating systems and environments that can be addressed using `--target` are supported, and it is supported on Windows, MacOS, and Linux environments.

InSpec Parallel is a new feature in **Chef InSpec 6**.

{{< note >}}

Currently, `inspec parallel` only supports the `exec` command.

{{< /note >}}

## How to use InSpec Parallel

The following example shows you how to execute the **Dev-Sec SSH Baseline** profile against five servers in parallel using `inpec parallel exec`.

1. Create an [option file](#option-file) that contains the CLI options that are passed to `inspec exec parallel`.

   The option file contains one invocation per line and specifies all options in each invocation.

   ```text
   # five-servers.txt
   # Option file for running against multiple SSH targets
   -t ssh://server1 --reporter cli:server1.out
   -t ssh://server2 --reporter cli:server2.out
   -t ssh://server3 --reporter cli:server3.out
   -t ssh://server4 --reporter cli:server4.out
   -t ssh://server5 --reporter cli:server5.out
   ```

1. Specify the option file that InSpec Parallel executes using the `-o` or `--option_file` flag in the InSpec CLI.

   ```bash
   inspec parallel exec https://github.com/dev-sec/ssh-baseline -o five-servers.txt -i file_name.pem
   ```

As InSpec Parallel runs, it shows the progress (percentage of controls completed) of each invocation, the process ID of each job, and writes log and error data to the `logs/` directory with each log file named after the process ID.

```bash
Press CTL+C to stop
                                                             InSpec Parallel
                                                    Running 5 invocations in 4 slots
-----------------------------------------------------------------------------------------------------------------------------------------
              Slot 1                            Slot 2                            Slot 3                            Slot 4
-----------------------------------------------------------------------------------------------------------------------------------------
           50132: 0.0%                       50133: 12.5%                       50134: 12.5%                           Done
```

## Option file

An option file is a text file that contains options passed to `inspec parallel`.
Chef InSpec ignores comments (starting with a `#`) and blank lines in an option file.
Chef InSpec invokes `inspec parallel` on each non-commented and non-blank line.

The only requirement is that every invocation in an option file must have a `--reporter` option.
The reporter option must write to a file or use the `automate` reporter to send an API post to a Chef Automate service.
For details of the available reporters and the full syntax of the reporter option, see the [Chef InSpec Reporter documentation]({{< relref "/inspec/reporters" >}}).

The simplest option file might look like this:

```text
# simple.txt
# Run five invocations, saving the output as ordinal names
--reporter cli:first.out
--reporter cli:second.out
--reporter cli:third.out
--reporter cli:fourth.out
--reporter cli:fifth.out
```

For this example, InSpec Parallel would run the same profile on the same target five times, it would send the output to each of the five reporters listed in the option file, and you would specify the target and profile when you invoke `inspec parallel exec` in the command line.

You can pass any options on the invocation line, including `--controls` (to divide a profile into sections), `--input` (to parameterize a profile and possibly target different resources), and `--target` (to target different machines or environments).

See the [Examples section](#examples) for more detail on how you can use an option file.

### Embedded Ruby templating

You can add Embedded RuBy (ERB) template escapes and Chef InSpec will evaluate it as an ERB template.
You can directly embed Ruby code into your option file, including loops and conditionals.
The rendered output of the option file is used as invocations.
This is especially useful with the `--dry-run` option.

The most common ERB templating is to use the `pid` variable to reference the process ID of the child process.
See the [Examples](#name-json-output-files-with-process-id) section for more information.

### Executable script

If the name of the option file ends in `.sh` (MacOS, Linux) or `.ps1` (Windows), InSpec Parallel executes the script and uses the standard output as the option file.

{{< note >}}

This feature is experimental and we would love to hear [feedback](https://github.com/inspec/inspec/issues/new/choose) from you.

{{< /note >}}

## Options

InSpec Parallel accepts options from the subcommand that it's managing. It also accepts the following options:

`--bg`
: The `--bg` option silences all output from the command and runs it in the background. InSpec Parallel will still write log files with the `--bg` option.

`--dry-run`
: The `--dry-run` option interprets the option file but does not execute it. Chef InSpec outputs the lines that would have been executed to the standard output. If you add `--verbose`, you can see all the CLI defaults that implicitly get added.

: {{< note >}}

  When calling `--dry-run`, you may notice that an extra reporter gets added to your invocation, `--reporter child-status`. This reporter is a special streaming reporter used to report status from the running child processes to the parent process and is a necessary part of the plumbing of InSpec Parallel.

  {{< /note >}}

`-j`
`--jobs`
: Use the `-j` or `--jobs` option to specify how many job slots InSpec Parallel uses.
  InSpec Parallel defaults to the number of hyperthreaded cores on your machine (for example, a dual-core machine with hyperthreading defaults to four jobs).
  The default is usually reasonable, but experimentation may be rewarding.

`-o`
`--option_file`
: Use the `-o` or `--option_file` option in the command line to specify the option file that InSpec Parallel will run.

## Examples

### Use the same options for each invocation

`inspec parallel exec` accepts all options that `inspec exec` does and passes them to each invocation as defaults.
This means that you do not have to specify repetitive options that are constant across all the invocations in an option file.

For example, if all machines take the same SSH key, you can specify it once on the top-level command line.

```text
# three-servers.txt
# Option file for running against multiple SSH targets
-t ssh://server1 --reporter cli:server1.out
-t ssh://server2 --reporter cli:server2.out
-t ssh://server3 --reporter cli:server3.out
```

```bash
inspec parallel exec profile_name -o three-servers.txt -i file_name.pem
```

### Name JSON output files with process ID

In this example, the `json` reporter saves output log files in the `logs` directory and names each one after the process ID using the `pid` ERB variable.
This technique would work with any [reporter]({{< relref "/inspec/reporters" >}}) that can write to a file.

```text
# pid-named-output.txt
# Option file in which the output is named after the PID of the process
--reporter json:logs/<%= pid %>.json
--reporter json:logs/<%= pid %>.json
--reporter json:logs/<%= pid %>.json
--reporter json:logs/<%= pid %>.json
```

After this profile is executed, the `logs` directory would have the following files:

- 1000.log
- 1000.json
- 1001.log
- 1001.json
- 1002.log
- 1002.json
- 1003.log
- 1003.json

### Run the same profile on different targets

You can run the same profile on multiple targets by specifying each target in the option file using the `-t` or `--target` option.

```text
# five-servers.txt
# Option file for running against multiple SSH targets
-t ssh://server1 --reporter cli:server1.out
-t ssh://server2 --reporter cli:server2.out
-t ssh://server3 --reporter cli:server3.out
-t ssh://server4 --reporter cli:server4.out
-t ssh://server5 --reporter cli:server5.out
```

Then specify the profile and the option file in the command line.

```bash
inspec parallel exec https://github.com/dev-sec/ssh-baseline -o five-servers.txt -i file_name.pem
```

If you have many or variable targets to run against, consider using ERB templating to read the list of targets after reading them from a CSV file or connecting to an API. You can also use a script to list your targets.

### Run different profiles on the same target

To run different profiles on the same target, specify the profile at the front of the invocation in the option file.

```text
# multi-profile.txt
https://github.com/dev-sec/ssh-baseline --reporter cli:ssh-baseline.out
https://github.com/dev-sec/linux-baseline --reporter cli:linux-baseline.out
```

Then invoke InSpec parallel by passing the target as a top-level option and a dummy name for the profile.

```bash
inspec parallel exec dummy -o multi-profile.txt -t ssh://server
```

### Run different parts of a profile in parallel

If your profile has well-named control IDs, you can use the `--controls` option to divide the profile into sections.
Suppose that your profile has sections named **C**, **S**, and **N** and the controls in each section have control IDs that start with the given letter,
then you can create an option file that divides the profile as follows:

```text
# divide-aws-bp.txt
--reporter cli:C.out --controls /^C/
--reporter cli:S.out --controls /^S/
--reporter cli:N.out --controls /^N/
```

When you run the following command, `inspec exec` runs three times, once for each of the **C**, **S**, and **N** sections of the profile.

```bash
inspec parallel exec aws-best-practices -o divide-aws-bp.txt -t aws://profile_name@us-east-2
```
