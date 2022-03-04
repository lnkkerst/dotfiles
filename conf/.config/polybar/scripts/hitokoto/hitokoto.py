#!/usr/bin/python
import requests
import sys
import json

headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36",
}

default_data_file = r"/home/pathsun/.config/polybar/scripts/hitokoto/hitokoto.json"
default_config_file = r"/home/pathsun/.config/polybar/scripts/hitokoto/hitokoto.conf"
default_now_file = r"/home/pathsun/.config/polybar/scripts/hitokoto/hitokoto.now"

ctype_list = ["动画", "漫画", "游戏", "游戏", "文学", "原创", "网络", "其他", "影视", "诗词", "网易云", "哲学", "抖机灵"]

def getFromWeb(ctype = "a"):
    return requests.get("https://v1.hitokoto.cn/", headers = headers, params = {"c": ctype}).json()


def writeToFile(hitokoto, data_file = default_data_file):
    with open(data_file, "w") as f:
        json.dump(hitokoto, f)

def loadFromFile(data_file=default_data_file):
    with open(data_file, "r") as f:
        return json.load(f)

def queryType(config_file = default_config_file):
    with open(config_file, "r") as f:
        return f.read().strip();

def changeType(ctype = "a", config_file = default_config_file):
    with open(config_file, "w") as f:
        f.write(ctype);

def getTypeName(ctype):
    return ctype_list[ord(ctype) - ord('a')]

def queryNow(now_file=default_now_file):
    with open(now_file, "r") as f:
        return f.read().strip();

def changeNow(cnow = "hito", now_file = default_now_file):
    with open(now_file, "w") as f:
        print(cnow)
        f.write(cnow);

if __name__ == "__main__":
    for i in sys.argv:
        if(i == 'get'):
            hito = getFromWeb(queryType())
            print("ok")
            writeToFile(hito)
            print(hito['hitokoto'])
        elif(i == 'hito'):
            print(loadFromFile()['hitokoto'])
        elif(i == 'from'):
            hito = loadFromFile()
            print("From: " + str(hito["from"]) + "    Author: " + str(hito["from_who"]))
        elif(i == 'next'):
            nt = queryType();
            if(nt == 'l'):
                nt = 'a';
            else:
                nt = chr(ord(nt) + 1)
            changeType(nt)
            print(getTypeName(nt))
        elif(i == 'prev'):
            nt = queryType();
            if(nt == 'a'):
                nt = 'l';
            else:
                nt = chr(ord(nt) - 1)
            changeType(nt)
            print(getTypeName(nt))
        elif(i == 'type'):
            print(getTypeName(queryType()))
        elif(i == 'toggle'):
            nn = queryNow()
            if(nn == "hito"):
                changeNow('from')
            else:
                changeNow('hito')
        elif(i == 'show'):
            if(queryNow() == 'hito'):
                print(loadFromFile()['hitokoto'])
            else:
                hito = loadFromFile()
                print("From: " + str(hito["from"]) + "    Author: " + str(hito["from_who"]))
