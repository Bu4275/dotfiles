#!/usr/bin/python
# -*- coding: utf-8-*-

import os
import shutil
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
files = ['vimrc', 'tmux.conf']

def move_file_to_home(file_name):
    home_path = os.getenv("HOME")
    dst = os.path.join(home_path, '.' + file_name)
    if os.path.exists(dst):
        print ('%s already exists!' % file_name)
    else:
        shutil.copyfile(file_name, dst)

    
def main():
    for file_name in files:
        move_file_to_home(file_name)


if __name__ == '__main__':
    main()




