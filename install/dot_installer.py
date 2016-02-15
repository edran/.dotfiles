import yaml
import pprint
import plumbum

class DotInstaller(object):
    def __init__(self, apps_path):
        self.pkgs_installer = PkgsInstaller()
        pkgs_installer.load_apps(apps_path)

        self.bk_home_path = "~/.home_backup"

    def checks(self):
        # check for sudo
        raw_input("")

    def setup_home(self):
        self.backup_home()
        self.link_home()

    def backup_home(self):
        files = [".inputrc",
                 ".profile",
                 ".gitconfig",
                 ".bashrc",
                 ".bash_aliases",
                 "bin",
                 ".config",
                 ".fonts",
                 ".tmux.conf",
                 ".Xresources",
                 ".urxvt",
                 ".emacs.d"]
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
        for f in files:
            print("Backing up %s" % f)
            f_path = plumbum.local.path("~/" + f)
            mv(f_path, back_dir)

    def link_home(sefl):
        ln = plumbum.cmd.ln

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
