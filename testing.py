#!/bin/env python

import os
import sys
import pwd

"""
Add local user account in Ubuntu 16.04 
"""

def rootCheck():
        """Check is user has UID 0"""

        if not os.getuid() == 0:
                print("This program requires ROOT privileges. Exiting.")
                sys.exit()

def userName():
        """Prompt for username"""


def userNameCheck(): 
        """Check if username exists"""
        pwd.getpwnam('fentonadmin')
        os.system('grep -w "root" /etc/passwd')
