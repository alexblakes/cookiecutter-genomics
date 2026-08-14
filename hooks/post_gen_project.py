import subprocess

subprocess.run(["git", "init"], check=True)
subprocess.run(["git", "add", "."], check=True)
subprocess.run(
    ["git", "commit", "-m", "Initial commit from cookiecutter-genomics"], check=True
)
