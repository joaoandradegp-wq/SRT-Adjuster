import requests

repos = [
    "joaoandradegp-wq/SRT-Adjuster",
    "joaoandradegp-wq/srt-adjuster"
]

for repo in repos:
    url = f"https://api.github.com/repos/{repo}/releases"
    r = requests.get(url)

    print("=" * 60)
    print("Repo:", repo)
    print("Status:", r.status_code)
    print(r.text)
