## nimporter sample using pyinstaller

### Environment

* windows 10
* Python 3.9
* Nim 1.4.3

### setup

```
pip install pyinstaller
pip install nimporter
nimble install nuuid
```

### execute sample

```
> python nimporter_sample.py
 a + b = 6
69b10db6-61d1-41f2-87a3-7e342389ff04
6
start threads
This is Thread-1
This is Thread-2
wait threads
```

### execute pyinstaller

```
> pyinstaller nimporter_sample.py --onefile
```

but output error messages. -> ModuleNotFoundError: No module named 'setuptools.py33compat'

```
> dist\nimporter_sample.exe
raceback (most recent call last):
  File "nimporter_sample.py", line 1, in <module>
    import nimporter
  File "c:\apps\python\python39\lib\site-packages\PyInstaller\loader\pyimod03_importers.py", line 493, in exec_module
    exec(bytecode, module.__dict__)
  File "nimporter.py", line 13, in <module>
  File "c:\apps\python\python39\lib\site-packages\PyInstaller\loader\pyimod03_importers.py", line 493, in exec_module
    exec(bytecode, module.__dict__)
  File "setuptools\__init__.py", line 24, in <module>
  File "c:\apps\python\python39\lib\site-packages\PyInstaller\loader\pyimod03_importers.py", line 493, in exec_module
    exec(bytecode, module.__dict__)
  File "setuptools\depends.py", line 6, in <module>
ModuleNotFoundError: No module named 'setuptools.py33compat'
[15952] Failed to execute script nimporter_sample
```

## edit spec file

add 'setuptools.py27compat' into hiddenimports 

```python
             # hiddenimports=[],
             hiddenimports=['setuptools.py33compat']
```

retry create execute module.

```
> pyinstaller nimporter_sample.spec
Traceback (most recent call last):
  File "nimporter_sample.py", line 1, in <module>
    import nimporter
  File "c:\apps\python\python39\lib\site-packages\PyInstaller\loader\pyimod03_importers.py", line 493, in exec_module
    exec(bytecode, module.__dict__)
  File "nimporter.py", line 13, in <module>
  File "c:\apps\python\python39\lib\site-packages\PyInstaller\loader\pyimod03_importers.py", line 493, in exec_module
    exec(bytecode, module.__dict__)
  File "setuptools\__init__.py", line 24, in <module>
  File "c:\apps\python\python39\lib\site-packages\PyInstaller\loader\pyimod03_importers.py", line 493, in exec_module
    exec(bytecode, module.__dict__)
  File "setuptools\depends.py", line 8, in <module>
ModuleNotFoundError: No module named 'setuptools.py27compat'
[22292] Failed to execute script nimporter_sample
```

add 'setuptools.py27compat' into hiddenimports 

```python
             # hiddenimports=[],
             hiddenimports=['setuptools.py33compat','setuptools.py27compat']
```

retry create execute module.

```
> pyinstaller nimporter_sample.spec
```

### run sample

```
> dist\nimporter_sample.exe
 a + b = 6
773d6a16-61d1-41f2-87a3-7e342389ff04
6
start threads
This is Thread-1
This is Thread-2
wait threads
```

