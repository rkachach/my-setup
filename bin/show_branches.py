#!/bin/python3

import argparse
from prettytable import PrettyTable
from subprocess import check_output
import os
import sys

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

def show_branches(prefix, main_branch):
    table = PrettyTable()
    format_table(table)
    G = "\033[0;32;40m"  # GREEN
    N = "\033[0m"        # Reset
    Y = "\033[0;33;40m"  # Yellow

    branches = ls_all_branches()
    merged_branches = ls_merged_branches(main_branch)

    for branch in branches.splitlines():
        if prefix not in branch:
            continue

        merged = branch in merged_branches
        curr_branch = '*' in branch
        branch_name = branch.strip() if not curr_branch else branch.strip().split(' ')[1]
        cnt_commits = check_output(['git', 'rev-list', f'{main_branch}..{branch_name}', '--count']).decode('utf').strip()
        try:
            output = check_output(['git', 'config', f'branch.{branch_name}.description']).decode('utf')
            desc = os.linesep.join([s for s in output.splitlines() if s])
        except:
            desc = '---'

        bmerged = "YES" if merged else "NO"
        if curr_branch:
            table.add_row([G+branch_name, desc, bmerged, cnt_commits+N])
        elif merged:
            table.add_row([Y+branch_name, desc, bmerged, cnt_commits+N])
        else:
            table.add_row([N+branch_name, desc, bmerged, cnt_commits+N])

    print(table)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-p', '--prefix', default='')
    parser.add_argument('-b', '--branch', help='main branch', default='master')
    args = parser.parse_args()
    show_branches(args.prefix, args.branch)
