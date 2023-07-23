#!/usr/bin/env python3

# <xbar.title>Zen</xbar.title>
# <xbar.version>v1.0.0</xbar.version>
# <xbar.author>Nantas Nardelli</xbar.author>
# <xbar.author.github>edran</xbar.author.github>
# <xbar.desc>Pills of zen from GitHub.</xbar.desc>
# <xbar.dependencies>python</xbar.dependencies>

from urllib import request

print(
    request.urlopen('https://api.github.com/zen').read().decode('utf-8')
)
