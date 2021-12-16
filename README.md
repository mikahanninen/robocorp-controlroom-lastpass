# LastPass Firefox extension in Robocorp Control Room

## Overview

This Robot demonstrates how to install LastPass Firefox extension
on runtime in Robocorp's Control Room Cloud container. Example could
be altered to install any Firefox extension.

## Missing logic

What has been left out of the example is implementation is a retry logic
covering necessity to complete IP verification. The Cloud container IP
address might change between runs and this will trigger access block
from the LastPass. Access can be verified by clicking the link in the
email sent by the LastPass.

## FAQ

**Q.** Why Chrome was not used ?

**A.** Chrome could not be used for this case, because Cloud container runs
are run in the headless mode and there is an issue with extension
installation on Chrome headless mode which could not be easily resolved.
