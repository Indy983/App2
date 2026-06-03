#!/usr/bin/env python3
"""Simple server that serves Flutter web build with correct WASM MIME types.
Usage: python3 serve_web.py [port]
"""
import http.server, sys, os

port = int(sys.argv[1]) if len(sys.argv) > 1 else 8080

class Handler(http.server.SimpleHTTPRequestHandler):
    def guess_type(self, path):
        mime = {'.wasm': 'application/wasm', '.js': 'application/javascript',
                '.mjs': 'application/javascript'}
        for ext, mt in mime.items():
            if path.endswith(ext):
                return mt
        return super().guess_type(path)

os.chdir(os.path.join(os.path.dirname(__file__), 'build/web'))
server = http.server.HTTPServer(('0.0.0.0', port), Handler)
print(f'Serving at http://0.0.0.0:{port}')
server.serve_forever()