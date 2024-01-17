#!/usr/bin/python3
import requests


def number_of_subscribers(subreddit):
    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:121.0)\
            Gecko/20100101 Firefox/121.0"
        }
    res = requests.get(url, headers=headers, allow_redirects=False).json()
    return (res.get("data").get("subscribers"))
