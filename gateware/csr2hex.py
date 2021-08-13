#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:ts=4:sw=4:softtabstop=4:smarttab:expandtab

import json

with open("csr.json", "r") as jsonfile:
    data = json.load(jsonfile)
    for n, a in data['memories'].items():
        print("%s : %08x %08x" % (n, a["base"], a["size"]))
    for n, a in sorted(data['csr_bases'].items(), key=lambda arg: int(arg[1])):
        print("%08x : %s" % (a, n))
