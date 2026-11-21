#!/usr/bin/env python3
"""Aggregate GoToRecord argument shapes, without outputting business data."""
import collections
import hashlib
import json
import sys
from pathlib import Path

path = Path(sys.argv[1])
content = path.read_bytes()
analysis = json.loads(content)
forms = analysis['source_overlay']['forms']
counts = collections.Counter()

def visit(node):
    if isinstance(node, dict):
        if node.get('action') == 'GoToRecord':
            args = node.get('arguments', [])
            # Only emit recognized numeric fields; redact names/expressions.
            counts[(len(args), str(args[0]) if args and str(args[0]) in
                    ('-1', '0', '1', '2', '7', '9', '10') else '<other>',
                    'empty' if len(args) > 1 and args[1] == '' else '<other>',
                    str(args[2]) if len(args) > 2 and str(args[2]) in
                    ('0', '1', '2', '3', '4', '5') else '<other>')] += 1
        for value in node.values():
            visit(value)
    elif isinstance(node, list):
        for value in node:
            visit(value)

visit(forms)
print(json.dumps({'analysis_sha256': hashlib.sha256(content).hexdigest(),
                  'source_forms': len(forms), 'action': 'GoToRecord',
                  'total': sum(counts.values()),
                  'argument_shapes': [{'length': key[0], 'object_type_token': key[1],
                    'object_name': key[2], 'record_token': key[3], 'count': count}
                    for key, count in sorted(counts.items())]}, indent=2))
