import requests
import base64
import json
from packaging.version import Version

CURRENT_VERSION = "1.1"

API_URL = (
    "https://api.github.com/repos/"
    "joaoandradegp-wq/SRT-Adjuster/"
    "contents/Update/update.json?ref=master"
)

HEADERS = {
    "User-Agent": "SRT-Adjuster-Updater/1.0",
    "Accept": "application/vnd.github.v3+json"
}

def check_update():
    print("Consultando update em:")
    print(API_URL)

    r = requests.get(API_URL, headers=HEADERS, timeout=10)
    print("Status HTTP:", r.status_code)
    r.raise_for_status()

    data = r.json()

    content_b64 = data["content"]
    content_json = base64.b64decode(content_b64).decode("utf-8")

    update_info = json.loads(content_json)

    latest_version = update_info["version"]
    download_url = update_info["url"]

    if Version(latest_version) > Version(CURRENT_VERSION):
        return True, latest_version, download_url

    return False, CURRENT_VERSION, None


if __name__ == "__main__":
    has_update, version, url = check_update()

    if has_update:
        print(f"🚀 Nova versão disponível: {version}")
        print(f"⬇ Download: {url}")
    else:
        print("✅ Você já está na versão mais recente.")
