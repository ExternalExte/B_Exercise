import subprocess
print("bbatch_wrapper is started!")
subprocess.run([f'echo "PROVE_RESULT="summary ok!" >> $GITHUB_OUTPUT'], shell=True)
with subprocess.Popen(["/opt/atelierb-free-4.7.1p1/startBB"], encoding='UTF-8',
                      stdin=subprocess.PIPE, stdout=subprocess.PIPE) as bbatch:
  bbatch.stdin.write('help\n')
  bbatch.stdin.flush()
  bbatch.stdout.flush()
  print(bbatch.stdout.readlines())
print("bbatch_wrapper is exit!")
