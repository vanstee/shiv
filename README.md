Shiv
====

Shiv is a quick and dirty hack to use chef node names in place of their hostnames.

Examples
--------

Need to ssh to a specific server? Normally you would probably do something like this:

```
$ knife node show node-name -a ec2.public_hostname
ec2.public_hostname:  ec2-hostname.compute-1.amazonaws.com

$ ssh ubuntu@ec2-hostname.compute-1.amazonaws.com
```

Try this instead:

```
$ shiv ssh ubuntu@node-name
```

Works with any other command too:

```
$ shiv scp ubuntu@node-name:/file .
```