# add_devbuild.py
from pathlib import Path
import subprocess
import sys

commit = subprocess.check_output(["git", "describe", "--always"],text=True).strip("\n")
version = f"GHADX Nightly {commit}"

path = sys.argv[1]

f = open(path, "w")

f.write(f'ghadx_version = "{version}"')

f.close()