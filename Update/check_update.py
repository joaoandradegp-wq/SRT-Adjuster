import requests
from packaging import version

CURRENT_VERSION = "1.2"

URL = "https://raw.githubusercontent.com/joaoandradegp-wq/SRT-Adjuster/main/update.json"

r = requests.get(URL, timeout=10)
r.raise_for_status()

data = r.json()

latest_version = data["version"]
download_url = data["url"]

print("Versão remota:", latest_version)

if version.parse(latest_version) > version.parse(CURRENT_VERSION):
    print("🚀 Nova versão disponível!")
    print("Download:", download_url)
else:
    print("✅ Você já está na versão mais recente.")
