#!/usr/bin/python

# Author: Nantas Nardelli
# License: MIT

import i3


def is_w_focused(o):
    wss = i3.get_workspaces()
    name = o[u'current_workspace']
    current = None
    for w in wss:
        if w[u'name'] == o['current_workspace']:
            current = w
            break
    return current[u'focused']


outputs = i3.get_outputs()

l = []
first = None

for w in outputs:
    if w[u'current_workspace'] is not None:
        l.append(w)
        if first is None:
            first = w if is_w_focused(w) else None

for o in l:
    if not is_w_focused(o):
        i3.workspace(o['current_workspace'])
    i3.command('move', 'workspace to output left')

# Makes sure to go back to the initial window
if not is_w_focused(first):
    i3.workspace(first[u'current_workspace'])
