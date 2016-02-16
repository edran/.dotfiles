#!/usr/bin/python3

import argparse
import install.dot_installer

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-v", "--verbose",
                        help="increase output verbosity",
                        action="count")
    parser.add_argument("-s", "--skip_checks",
                        help="Skip checks before proceeding with installation",
                        action="store_true")
    parser.add_argument()
    parser.add_argument()
    parse.parse_args()

    di = dot_installer.DotInstaller()
    di.checks()

if __name__ == "__main__":
    main()
