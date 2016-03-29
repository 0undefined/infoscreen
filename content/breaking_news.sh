#!/usr/bin/env python3

import time
import os.path
import subprocess
import html

def show():
    basedir = os.path.dirname(__file__)
    breaking_file = os.path.expanduser('~/breaking_news')
    seconds_passed = time.time() - os.stat(breaking_file).st_mtime
    if seconds_passed > 60 * 60 * 2: # Two hours
        return
    
    with open(breaking_file) as f:
        breaking_news = html.escape( f.read().strip() )
    
    with open(os.path.join(basedir, 'res/breaking_news_skabelon.html')) as f:
        d = f.read()
    
    fname = '/tmp/breaking_news.html'
    
    with open(fname, 'w') as f:
        print(d.replace('{BREAKING_NEWS}', breaking_news), file=f)
    
    subprocess.check_call(['surf', '-p', 'file://' + fname])

if __name__ == '__main__':
    show()
