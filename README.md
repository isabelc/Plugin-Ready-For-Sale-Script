# Plugin-Ready-For-Sale-Script
Prepares a WP plugin for sale by zipping and pushing only readme.txt to GitHub

Prepares a local plugin for sale by compressing the plugin into a `.zip` file, moving it out to another folder on your local system, and pushing only the readme.txt file to GitHub so that it can be read by the Easy Digital Downloads Software Licensing readme parser.

**Prerequisite:** Main plugin file slug must be the same as the plugin folder name.
**Prerequisite:** The Version in the plugin header must start at the beginning of the line wihout a preceding *. So, the main plugin header must be [WordPress style](https://codex.wordpress.org/File_Header#Plugin_File_Header_Example), not PHPDoc DocBlock style.
**Prerequisite:** Existing git repo consising of only the readme.txt file, with its remote origin set up on GitHub. Both local and remote repo names must match the plugin slug, exactly.

1) Edit `ready.sh` and fill in the necessary config values at the top of the file.
2) Place `ready.sh` in the local plugin directory
3) Run `ready.sh` after updating the version in the main plugin file, and the changelog in the readme.txt file.

WARNING: this script pushes to GitHub.
