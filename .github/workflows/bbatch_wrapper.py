import subprocess
print("bbatch_wrapper is started!")
subprocess.run([f'echo "test_summary="summary ok!" >> $GITHUB_STEP_SUMMARY'], shell=True)
print("bbatch_wrapper is exit!")
