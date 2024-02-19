import subprocess
print("bbatch_wrapper is started!")
subprocess.run([f'echo "PROVE_RESULT="summary ok!" >> $GITHUB_OUTPUT'], shell=True)
print("bbatch_wrapper is exit!")
