import subprocess
import os
import shutil
import sys

if os.path.exists('bdp'):
  shutil.rmtree('bdp')
if os.path.exists('lang'):
  shutil.rmtree('lang')
os.makedirs('bdp')
os.makedirs('lang')
components = [os.path.basename(file) for file in os.scandir() if file.is_file() and file.name.endswith(('.mch', '.ref', '.imp'))]
targets = [os.path.splitext(os.path.basename(tg))[0] for tg in sys.argv[1:]]

print('all components')
print(components)
print('targets')
print(targets)

result = []
with subprocess.Popen(["/opt/atelierb-free-4.7.1p1/startBB"], stdin=subprocess.PIPE, stdout=subprocess.PIPE , stderr=None) as bbatch:
  bbatch.stdin.write(f'crp repo bdp lang SOFTWARE\n'.encode())
  bbatch.stdin.write(f'op repo\n'.encode())
  for c in components:
    bbatch.stdin.write(f'af {c}\n'.encode())
  for tg in targets:
    bbatch.stdin.write(f'pr {tg} 0\n'.encode())
  for tg in targets:
    bbatch.stdin.write(f's {tg}\n'.encode())
  bbatch.stdin.write('quit\n'.encode())
  bbatch.stdin.flush()
  output = bbatch.stdout.readlines()
  inside = False
  for line in output: 
    line = line.decode()
    if line == 'Beginning interpretation':
      continue
    if line.find('End of Printing the status') != -1:
      inside = False
    if inside:
      result.append(line)
    if line.find('Printing the status of') != -1:
      inside = True
result = ''.join(result)
print(result)
shutil.rmtree('bdp')
shutil.rmtree('lang')
