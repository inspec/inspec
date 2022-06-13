+++
title = "InSpec Parallel"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "InSpec Parallel"
    identifier = "inspec/parallel.md InSpec Parallel"
    parent = "inspec"
    weight = 20
+++

InSpec can automatically manage multiple profile executions on a system targeting various remote systems and environments.

## InSpec Parallel Basics

The `inspec` CLI supports parallelization by introducing a command, `inspec parallel`. This command manages new processes, collecting their status updates, managing their exit codes, and providing updates to the user. Currently, only the `exec` command is supported for parallelization. However, more commands may be supported in the future.

InSpec Parallel was introduced in InSpec 6, and is supported on Windows, MacOS, and Linux environments. All target operating systems and environments that can be addressed using `-t` are supported.

### Command: `inspec parallel exec`

Use the `inspec parallel exec PROFILE -o OPTIONFILE [COMMON OPTIONS]` command to execute profiles in parallel. An option file is a text file that contains CLI options to `inspec exec`, one invocation per line, that describes how to run each invocation.

For example, to run the **Dev-Sec SSH Baseline** profile against five servers, you can create an option file as follows:

```bash
# five-servers.txt
# Options file for running against multiple SSH targets
-t ssh://server1 --reporter cli:server1.out
-t ssh://server2 --reporter cli:server2.out
-t ssh://server3 --reporter cli:server3.out
-t ssh://server4 --reporter cli:server4.out
-t ssh://server5 --reporter cli:server5.out
```

and then invoke InSpec Parallel:

```bash
inspec parallel exec https://github.com/dev-sec/ssh-baseline -o five-servers.txt -i my-key.pem
Press CTL+C to stop
                                                             InSpec Parallel
                                                    Running 5 invocations in 4 slots
-----------------------------------------------------------------------------------------------------------------------------------------
              Slot 1                            Slot 2                            Slot 3                            Slot 4
-----------------------------------------------------------------------------------------------------------------------------------------
           50132: 0.0%                       50133: 12.5%                       50134: 12.5%                           Done
```

As InSpec Parallel runs, it shows the progress (percentage of controls completed) of each invocation. It will show the Process ID of each job. It also writes log and error data to the `logs/` directory, with each log file named after the Process ID.

### Option File Basics

An Option File is a text file that contains options for `inspec exec`. Comments (starting with a `#`) and blank lines are ignored. Each non-comment, non-blank line is treated as an invocation of `inspec exec`.

The only constraint on the options is that every invocation must have a `--reporter` option. The reporter option must write to a file (or use the `automate` reporter to send an API post to the Automate service). For details of the available reporters and the full syntax of the reporter option, see the [Reporter Documentation](https://docs.chef.io/inspec/reporters/#syntax).

The most straightforward option file might look like this:

```bash
# simple.txt
# Run five invocations, saving the output as ordinal names
--reporter cli:first.out
--reporter cli:second.out
--reporter cli:third.out
--reporter cli:fourth.out
--reporter cli:fifth.out
```

This runs five invocations with the target and profile are specified on the command line. It specifies where to save the output of each invocation.

{{< note >}}

This option file runs the same profile five times on the same target, which is not very useful.

{{< /note >}}

You can pass any options on the invocation line, including `--controls` (to divide a profile into sections), `--input` (to parameterize a profile and possibly target different resources), and `--target` (to target different machines or environments).

Refer to the [Examples]({{< relref "#Examples" >}}) section on how these profiles can be used.

### Advanced Option File Features

#### Using Embedded RuBy Templating in the Option File

The option file may contain Embedded RuBy (ERB) template escapes, and it is evaluated as an ERB template. You can directly embed Ruby code into your option file, including loops and conditionals. The rendered output of the option file is used as invocations. This is especially useful with **--dry-run** mode.

The most common ERB templating is to use the `pid` variable to reference the Process ID of the child process. See the [Examples]({{< relref "#Examples" >}}) section.

#### Executing a Script as the Option File

If the name of the option file ends in `.sh` (MacOS, Linux) or `.ps1` (Windows), the file is executed, and `STDOUT` is used as the option file.

This feature is experimental, and we would love to hear [feedback](https://github.com/inspec/inspec/issues/new/choose) from you.

### The -j Job Count Option

You can control how many job slots are used by providing the `-j JOBS` option. It defaults to the number of hyperthreaded cores on your machine (for example, a dual-core machine with hyperthreading defaults to four jobs). The default is usually reasonable, but experimentation may be rewarding.

### Dry-run Mode

When passed the `--dry-run` option, InSpec Parallel interprets the option file but does not execute it. It outputs to `STDOUT` the invocation lines would have executed. If you add `--verbose`, you can see all the CLI defaults that implicitly get added.

{{< note >}}

When calling `--dry-run`, you may notice that an extra reporter gets added to your invocation, `--reporter child-status`. This reporter is a special streaming reporter used to report status from the running child processes to the parent process and is a necessary part of the plumbing of InSpec Parallel.

{{< /note >}}

## Examples

### Run with No Output to the Console

You can provide the `--bg` option to silence all output from the command and run it in the background. Logfiles are still written.

### Use the Same Options for Each Invocation

`inspec parallel exec` accepts all options that `inspec exec` does and passes them to each invocation as defaults. This means that you do not have to specify repetitive options that are constant across all the invocations across the options file.

For example, if all machines take the same SSH key, you can specify it once on the top-level command line. Using `-dry-run` and `inspec parallel exec` shows that it applies the `-i` option to all invocations:

```bash
# three-servers.txt
# Options file for running against multiple SSH targets
-t ssh://server1 --reporter cli:server1.out
-t ssh://server2 --reporter cli:server2.out
-t ssh://server3 --reporter cli:server3.out
```

```bash
inspec parallel exec someprofile -o three-servers.txt -i mykey.pem --dry-run
inspec exec someprofile -t ssh://server1 --reporter child-status cli:server1.out --key-files mykey.pem
inspec exec someprofile -t ssh://server2 --reporter child-status cli:server2.out --key-files mykey.pem
inspec exec someprofile -t ssh://server3 --reporter child-status cli:server3.out --key-files mykey.pem
```

### Get JSON Output Named Like the Log Files

You can name your output files like the logfiles (named with the process ID and placed in the **logs** directory). InSpec Parallel offers a special ERB variable, `pid`. This example uses the `json` reporter, however, this technique would work with any [reporter](https://docs.chef.io/inspec/reporters/) that can write to a file.

Try this option file:

```bash
# pid-named-output.txt
# Option file in which the output is named after the PID of the process
--reporter json:logs/<%= pid %>.json
--reporter json:logs/<%= pid %>.json
--reporter json:logs/<%= pid %>.json
--reporter json:logs/<%= pid %>.json
```

This option file runs a given profile locally four times, leaving a **logs** directory that looks like:

```bash
ls logs
1000.log  1000.json   1001.log  1001.json   1002.log   1002.json  1003.log  1003.json
```

### Run the Same Profile on Different Targets

Running the same profile on multiple targets is easy with the `inspec parallel exec` command. Create an option file that varies the `-t target` option on each invocation (you may also use the more complex `-b backend` syntax with multiple options).

```bash
# five-servers.txt
# Options file for running against multiple SSH targets
-t ssh://server1 --reporter cli:server1.out
-t ssh://server2 --reporter cli:server2.out
-t ssh://server3 --reporter cli:server3.out
-t ssh://server4 --reporter cli:server4.out
-t ssh://server5 --reporter cli:server5.out
```

and then invoke InSpec Parallel:

```bash
inspec parallel exec https://github.com/dev-sec/ssh-baseline -o five-servers.txt -i my-key.pem
```

If you have many or variable targets to run against, consider using ERB templating to read the list of targets after reading them from a CSV file or connecting to an API. You can also use a script to list your targets.

### Run Different Profiles on the Same Target

To run different profiles on the same target, override the profile name by placing it at the front of the invocation in the option file.

```bash
# multi-profile.txt
https://github.com/dev-sec/ssh-baseline --reporter cli:ssh-baseline.out
https://github.com/dev-sec/linux-baseline --reporter cli:linux-baseline.out
```

Then invoke InSpec parallel, passing the target as a top-level option and a dummy name for the profile.

```bash
inspec parallel exec dummy -o multi-profile.txt -t ssh://my-server
```

### Run Different Parts of a Profile in Parallel

If your profile has well-named control IDs, you can use the `--controls` option to divide the profile into sections. Suppose that the AWS-BP profile has sections named **C**, **S**, and **N**, and the controls in each section have control IDs that start with the given letter, then you can divide the profile as follows:

```bash
# divide-aws-bp.txt
--reporter cli:C.out --controls /^C/
--reporter cli:S.out --controls /^S/
--reporter cli:N.out --controls /^N/
```

When you run:

```bash
inspec parallel exec aws-best-practices -o divide-aws-bp -t aws://myprofile@us-east-2
```

The command `inspec exec` runs three times, each for the **C**, **S**, and **N** sections of the profile.
