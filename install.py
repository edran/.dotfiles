#!/usr/bin/env python3

import argparse
from install import dot_installer

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-v", "--verbose",
                        help="increase output verbosity",
                        action="count",
                        default=0)
    parser.add_argument("-s", "--skip_checks",
                        help="Skip checks before proceeding with installation",
                        action="store_true",
                        default=False)
    args = parser.parse_args()

    di = dot_installer.DotInstaller("install/apt.yml", "install/setup.yml")
    if not args.skip_checks:
        di.checks()
    print("All done!")

if __name__ == "__main__":
    main()
