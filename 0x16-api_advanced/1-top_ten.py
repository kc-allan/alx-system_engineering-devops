#!/usr/bin/python3
"""
Fetches titles for the top ten hot topics
"""
import requests


def top_ten(subreddit):
    url = "https://www.reddit.com/r/{}/hot".format(subreddit)
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:121.0)\
            Gecko/20100101 Firefox/121.0"
	}
    response = requests.get(url + ".json", headers=headers, allow_redirects=False)
    if response.status_code == 200:
        response = response.json()
        children = response.get("data").get("children")
        for i in range(10):
            print(children[i].get("data").get("title"))
    else:
        print(0)