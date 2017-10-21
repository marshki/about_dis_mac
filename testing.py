#!/bin/env python

import os 
import sys 

"""
Add local user account in Ubuntu 16.04 
"""

def rootCheck(): 
        """Check is user has UID 0"""

        if not os.getuid() == 0:
                print("This program requires ROOT privileges. Exiting.")
                sys.exit() 

def usernameCheck(): 
        """Check if username exists"""

