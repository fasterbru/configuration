import os
import install.utils

"""install configs for terminal"""


def main(settings_object, project_root, force = False):
    # all paris of [config, symlink] without prefixes
    all_pairs = (
        ("bashrc",             ".bashrc"),
        ("inputrc",            ".inputrc"),
        ("tmux",               ".tmux.conf"),
        ("zshrc",              ".zshrc"),
        ("zaw-bookmarks",      ".zaw-bookmarks"),
        ("termite",            ".config/termite/config"),
    )

    settings = settings_object.get_terminal_settings()

    # get symlink_pairs by treatment settings
    symlink_pairs = install.utils \
        .get_symlink_pairs_by_treatment_settigns(all_pairs, settings)

    # relative prfix
    config_prefix = os.path.join(project_root, "terminal")
    symlink_prefix = os.path.expanduser("~/")
    # make absolute paths
    install.utils.make_absolute_path(symlink_pairs, config_prefix, symlink_prefix)

    # process and exit
    return install.utils.create_list_of_symlink(symlink_pairs, force)

