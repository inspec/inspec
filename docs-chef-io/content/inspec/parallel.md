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

InSpec can automatically manage multiple profile executions on a system, targeting multiple remote targets.

## InSpec Parallel Basics

The `inspec` CLI supports parallelization by introducing a special command, `inspec parallel`. This command manages creating new processes, collecting their status updates, managing their exit codes, and providing updates to the user. Currently, only the `exec` command is supported for parallelization, but more command may be supported in the future.

InSpec Parallel was introduced in InSpec 6, and is supported on Windows, MacOS, and Linux installations. All supported target OSes and environments that can be addressed using `-t` are supported.

### The `inspec parallel exec` Command

To execute profiles in parallel, use the `inspec parallel exec PROFILE -o OPTIONFILE [COMMON OPTIONS]` command. An optionfile is a text file that contains CLI options to `inspec exec`, one invocation per line, that describes how to run each invocation.

For example, to run the Dev-Sec SSH Baseline profile against five servers, you could create an options file like this:

```
# five-servers.txt
# Options file for running against multiple SSH targets
-t ssh://server1 --reporter cli:server1.out
-t ssh://server2 --reporter cli:server2.out
-t ssh://server3 --reporter cli:server3.out
-t ssh://server4 --reporter cli:server4.out
-t ssh://server5 --reporter cli:server5.out
```

and then invoke InSpec Parallel:

```
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

The only constraint on the options is that every invocation MUST have a `--reporter` option, and that reporter option must write to a file (or use the `automate` reporter to send an API post to the Automate service). For details of which reporters are available and the full syntax of the reporter option, see the [Reporter Documentation](https://docs.chef.io/inspec/reporters/#syntax).

The simplest option file might look like this:

```
# simple.txt
# Run five invocations, saving the output as ordinal names
--reporter cli:first.out
--reporter cli:second.out
--reporter cli:third.out
--reporter cli:fourth.out
--reporter cli:fifth.out
```

This will run five invocations - the target and profile will be specified on the command line. All this specifies is where to save the output of each invocation. Note that this will run the same profile 5 times on the same target - not very useful.

You can pass any options you like on the invocation line, including `--controls` (to divide a profile into sections), `--input` (to paramaterize a profile and possibly target different resources), and `--target` (to target different machines / environments entirely). See the Examples section for how these may be used.

### Advanced Option File Features

#### Using ERB Templating in the Option File

The optionfile may contain ERB template escapes, and it will be evaluated as an ERB template. This means you can directly embed Ruby code into your optionfile if you wish, including loops and conditionals. The rendered output of the optionfile will be used as invocations. This is especially useful with --dry-run mode.

The most common ERB templating is to use the `pid` variable to reference the Process ID of the child process. See the Examples section.

#### Executing a Script as the Option File

If the name of the optionfile ends in `.sh` (MacOS, Linux) or `.ps1`, then the file will be executed and it STDOUT will be used as the optionfile.

This feature is experimental, and we'd love to have [feedback](https://github.com/inspec/inspec/issues/new/choose) on how it works for you.

### The -j Job Count Option

You can control how many job slots are used by passing the -j JOBS option. It will default to the number of hyperthread cores on your machine (for example, a dual core machine with hyperthreading will default to 4 jobs). The default is usually reasonable, but experimentation may be rewarding.

### Dry-run Mode

When passed the `--dry-run` option, InSpec Parallel will interpret the optionfile, but not execute it. Instead, it will output to STDOUT the invocation lines that it would have executed. If you add `--verbose` as well, you will also see all of the CLI defaults that implicitly get added.

Note: You may notice when calling `--dry-run` that an extra reporter gets added to your invocation - `--reporter child-status`. This reporter is a special streaming reporter used to report status from the running child processes to the parent process, and is a necessary part of the plumbing of InSpec Parallel.

## Examples

### Run with No Output to the Console

To silence all output from the command and run it in the background, you can provide the `--bg` option. Logfiles will still be written.

### Use the Same Options to Each Invocation

`inspec parallel exec` accepts all options that `inspec exec` does, and passes them on to each individual invocation as defaults. This means that you don't have to specify repetitive options that are constant across all the invocations throughout your options file.

For example, if all machines take the same SSH key, you can specify it once on the top-level command line. Using `-dry-run`, `inspec exec parallel` will show that it applies the `-i` option to all invocations:

```
# three-servers.txt
# Options file for running against multiple SSH targets
-t ssh://server1 --reporter cli:server1.out
-t ssh://server2 --reporter cli:server2.out
-t ssh://server3 --reporter cli:server3.out
```

```
inspec parallel exec someprofile -o three-servers.txt -i mykey.pem --dry-run
inspec exec someprofile -t ssh://server1 --reporter child-status cli:server1.out --key-files mykey.pem
inspec exec someprofile -t ssh://server2 --reporter child-status cli:server2.out --key-files mykey.pem
inspec exec someprofile -t ssh://server3 --reporter child-status cli:server3.out --key-files mykey.pem
```

### Get JSON Output Named Like the Log Files

If you would like your output files to be named like the logfiles (that is, named with the process ID and placed in the logs/ directory) InSpec Parallel offers a special ERB variable for that, `pid`. This example uses the `json` reporter, but of course this technique would work with any [reporter](https://docs.chef.io/inspec/reporters/) that can write to a file. Try this option file:

```
# pid-named-output.txt
# Option file in which the output is named after the PID of the process
--reporter json:logs/<%= pid %>.json
--reporter json:logs/<%= pid %>.json
--reporter json:logs/<%= pid %>.json
--reporter json:logs/<%= pid %>.json
```

This option file will run a given profile locally four times, leaving a logs/ directory that looks like:

```
ls logs
1000.log  1000.json   1001.log  1001.json   1002.log   1002.json  1003.log  1003.json
```
### Run the Same Profile on Different Targets

Running the same profile on multiple targets is easy with InSpec Parallel Exec. Create an option file that varies the `-t target` option on each invocation (you may also use the more complex -b backend syntax with multiple options).

```
# five-servers.txt
# Options file for running against multiple SSH targets
-t ssh://server1 --reporter cli:server1.out
-t ssh://server2 --reporter cli:server2.out
-t ssh://server3 --reporter cli:server3.out
-t ssh://server4 --reporter cli:server4.out
-t ssh://server5 --reporter cli:server5.out
```

and then invoke InSpec Parallel:

```
inspec parallel exec https://github.com/dev-sec/ssh-baseline -o five-servers.txt -i my-key.pem
```

If you have many or variable targets to run against, consider using ERB templating to read the list of targets after reading them from a CSV file, or connecting to an API. You can also use a script to list your targets.

### Run Different Profiles On the Same Target

To run different profiles on the same target, override the profile name by placing it at the front of the invocation in the option file.

```
# multi-profile.txt
https://github.com/dev-sec/ssh-baseline --reporter cli:ssh-baseline.out
https://github.com/dev-sec/linux-baseline --reporter cli:linux-baseline.out
```

Then invoke InSpec parallel passing the target as a top-level option, and a dummy name for the profile.

```
inspec parallel exec dummy -o multi-profile.txt -t ssh://my-server
```

### Run Different Parts of a Profile in Parallel

If your profile has well-named control IDs, you may be able to use the `--controls` option to divide the profile into sections. Suppose that the AWS-BP profile has sections named C, S, and N, and the controls in each section have control IDs that start with the given letter. Then you can divide the profile like so:

```
# divide-aws-bp.txt
--reporter cli:C.out --controls /^C/
--reporter cli:S.out --controls /^S/
--reporter cli:N.out --controls /^N/
```

Then when you run:

```
inspec parallel exec aws-best-practices -o divide-aws-bp -t aws://myprofile@us-east-2
```

InSpec Exec will be run three times, once each for the C, S, and N sections of the profile.
