#!/usr/bin/env python3
import os
import pathlib

from plumbum import cli
from plumbum.cmd import hostname, vim


SETUP_DIR = os.path.dirname(os.path.realpath(__file__))
MANAGED_CONFIGS = {
    "termite": {
        "files": {
            ("./termite/config", "{home}/.config/termite/config")
        },
        "setup": []
    },
    "tmux": {
        "files": {
            ("./tmux/.tmux.config", "{home}/.tmux.config")
        },
        "setup": []
    },
    "vim": {
        "files": [
            ("./vim/.vimrc", "{home}/.vimrc")
        ],
        "setup": [
            lambda: vim("+PlugInstall +qall")
        ]
    },
    "zsh": {
        "files": {
            ("./zsh/.zshrc", "{home}/.zshrc")
        },
        "setup": []
    },
}

HOST_CONFIGS = {
    "palazo": {},
    "ivy": {}
}

HOST = hostname().strip("\n")


def escape_host_vars(file_path: str):
    return file_path.format(
        home=pathlib.Path.home()
    )


def print_configs(configs):
    for tool in configs:
        print("%s%s" % (2*" ", tool))
        files = configs[tool]["files"]
        for src_file, tgt_file in files:
            print("{indent}{src} -> {tgt}".format(
                indent=4*" ",
                src=src_file,
                tgt=escape_host_vars(tgt_file)
            ))


class SetupConfig(cli.Application):
    PROGNAME = "my_host_setup"
    VERSION = "1.0"

    def main(self):
        configs = MANAGED_CONFIGS
        host_configs = HOST_CONFIGS[HOST]

        print("Configs:")
        print_configs(configs)
        print("Host configs:")
        print_configs(host_configs)


if __name__ == "__main__":
    SetupConfig.run()
