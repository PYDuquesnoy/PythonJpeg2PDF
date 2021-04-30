# Python Scripts

These are some examples of python as Scripts that can be invoked interactively or from the command line

| Example | Description                                                  |
| ------- | ------------------------------------------------------------ |
| jpg2pdf | A Very basic example tha takes a JPEG image an creates a PDF file from it. Real World use case requested by a healthcare interoperability customer. |
|         |                                                              |



## Installing Python on Windows using PowerShell:

You can specify the Exact version....here is an example with 3.7.4:

```
# download
PS C:\Users\Administrator> Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.7.4/python-3.7.4-amd64.exe" -OutFile "python-3.7.4-amd64.exe" 

# install (to System Wide + set PATH)
PS C:\Users\Administrator> .\python-3.7.4-amd64.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0 

# reload environment variables
PS C:\Users\Administrator> $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

PS C:\Users\Administrator> python -V 
Python 3.7.4
```



