#!/usr/bin/python3

#! we can still use dialog instead of curses through a connector api
#! see pythondialog on pypi

#! we will run commands in background and track their stdouts stdinps in order to control them

#! remember to track error logs to a proper file

#! at the end of the process give user to opportunity to save their installation for sharing!
#! remember we have a system that we can share our installations with it

import subprocess

# print(subprocess.PIPE)

command = 'echo "hello world!"'
process = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
# process.communicate()
output, error = process.communicate()

print(output)
print(error)
