#!/bin/python3

import argparse
from prettytable import PrettyTable
import subprocess
from subprocess import check_output
import os
import sys
import re


def format_table(table):
    table.field_names = ["branch", "description", "merged", "commits"]
    table.align["branch"] = "l"
    table.align["description"] = "l"
    table.align["merged"] = "l"
    table.align["commits"] = "l"


def ls_all_branches():
    try:
        return check_output(['git', 'branch']).decode('utf')
    except:
        sys.exit(1)


def ls_merged_branches(branch_name):
    try:
        return check_output(['git', 'branch', '--merged', branch_name]).decode('utf')
    except:
        sys.exit(1)


def ls_local_not_tracked_branches():
    try:
        cmd = """git branch --format "%(refname:short) %(upstream)" | awk '{if (!$2) print $1;}'"""
        output = subprocess.getoutput(cmd)
        return output.split('\n')
    except:
        sys.exit(1)


def remove_empty_lines(input_str):
    return os.linesep.join([s for s in input_str.splitlines() if s])


def get_branch_description(branch_name):
    try:
        # First, we try to use any description set by the user
        out = check_output(['git', 'config', f'branch.{branch_name}.description']).decode('utf')
        return remove_empty_lines(out)
    except:
        # No user desc is available, let's use the last commit description
        out = check_output(['git', 'log', '--oneline', '-n',  '1', f'{branch_name}']).decode('utf')
        out = remove_empty_lines(out)
        if out:
            msg = re.search('[0-9a-fA-F]+ (.+)', out).groups()[0] #  skip rev hash
            return (msg[0:50] + '..') if len(msg) > 50 else msg
        else:
            return "---"


def get_default_branch():
    return 'main'
    cmd = """git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'"""
    output = subprocess.getoutput(cmd)
    return os.linesep.join([s for s in output.splitlines() if s])


def show_branches(prefix, main_branch):
    table = PrettyTable()
    format_table(table)
    G = "\033[0;32;40m"  # GREEN
    N = "\033[0m"        # Reset
    Y = "\033[0;33;40m"  # Yellow

    branches = ls_all_branches()
    merged_branches = ls_merged_branches(main_branch)
    local_branches = ls_local_not_tracked_branches()
    master_branch = get_default_branch()

    for branch in branches.splitlines():
        branch = branch.strip()
        if prefix not in branch:
            continue

        curr_branch = '*' in branch
        branch = branch.replace('* ', '') # remove curr branch indicator
        merged = (branch in merged_branches) and (branch not in local_branches) and (branch != master_branch)
        cnt_commits = int(check_output(['git', 'rev-list', f'{main_branch}..{branch}', '--count']).decode('utf').strip())
        desc = get_branch_description(branch)

        bmerged = "YES" if (merged) else "NO"
        if curr_branch:
            table.add_row([G+branch, desc, bmerged, f'{cnt_commits}'+N])
        elif merged:
            table.add_row([Y+branch, desc, bmerged, f'{cnt_commits}'+N])
        else:
            table.add_row([N+branch, desc, bmerged, f'{cnt_commits}'+N])

    print(table)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-p', '--prefix', default='')
    parser.add_argument('-b', '--branch', help='main branch', default=get_default_branch())
    args = parser.parse_args()
    show_branches(args.prefix, args.branch)
