import sys
import os
import yaml
import pprint
import plumbum

class DotInstaller(object):
    def __init__(self, apps_path, setup_path):
        self.apps_path = apps_path
        self.setup_path = setup_path
        self.pkgs_installer = PkgsInstaller()
        self.pkgs_installer.load_apps(apps_path)
        self.bk_home_path = "~/.home_backup"
        settings = []
        with open(self.setup_path) as setup_f:
            settings = yaml.safe_load(setup_f)

        self.backup_files = settings["backup"]
        self.link_files = settings["linking"]

    def checks(self):
        # check for sudo
        if os.getuid() != 0:
            print("This script requires root permissions. Run it with",
                  "sudo please!")
            sys.exit(1)
        # make sure you really want to go through it
        while True:
            response =input("This installation procedure is going"
                            " to make changes to your home.\nAre you"
                            " sure you want to do this? [Y/n] ")
            if response.lower() == "y" or response == "":
                break
            elif response.lower() == "n":
                print("Exiting installation procedure!")
                sys.exit(0)
            else:
                print("Invalid answer: %s" % (response))

    def setup_home(self):
        self.backup_home()
        self.link_home()

    def backup_home(self):
        mv = plumbum.cmd.mv
        mkdir = plumbum.cmd.mkdir
        rm = plumbum.cmd.rm

        back_dir = plumbum.local.path(self.bk_home_path)
        if not back_dir.exists():
            print("Creating backup folder at %s"
                  % (self.bk_home_path))
            mkdir(self.bk_home_path)
        else:
            print("Deleting and re-creating backup folder at %s" %
                  (self.bk_home_path))
            rm("-rf ", back_dir)
        for f in self.bk_files:
            print("Backing up %s" % f)
            f_path = plumbum.local.path("~/" + f)
            mv(f_path, back_dir)

    def link_home(self):
        ln = plumbum.cmd.ln
        for f in self.link_files:
            dot_path = self.dotfiles + f[0]
            home_path = plumbum.local.path("~/" + f[1])
            print("Linking %s to %s" %
                  (dot_path, home_path))
            ln("-s", dot_path, home_path)

    def setup_os(self):
        self.install_pkgs()

    def install_pkgs():
        self.pkgs_installer.install_apt_pkgs()
        self.pkgs_installer.install_others()

class PkgsInstaller(object):
    def __init__(self):
        self.apt_pkgs = []
        self.other_pkgs = []

    def load_apps(self, apps_path):
        y_data = None
        with open(apps_path) as af:
            y_data = yaml.safe_load(af)

        self.apt_pkgs = y_data["apt"]

        self.other_pkgs = y_data["others"]
