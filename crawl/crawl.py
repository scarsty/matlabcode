# -*- coding: utf-8 -*-
# -----------------------------------------
# 这是一个爬虫
# -----------------------------------------

import urllib2
import urllib
import re
import os
import sys
from bs4 import BeautifulSoup
import pdf2txt
import nltk
#import HTMLParser

# remove the html tags from the content


def filter_tags(text):
    text = re.sub(r'</?\w+[^>]*>', '', text)
    text = re.sub(r'<\![^>]*>', '', text)
    text = re.sub(r'[^\x00-\x7f]', '', text)
    text = re.sub(r'[\(\)\[\]\{\}]', ' ', text)
    return text


# find the values in the content
def find_value(text, key):
    words = text.lower().split()
    value = []
    credit = 0
    for onekey in key:
        keys = onekey.split()
        for i_word in range(len(words)):
            finded = True
            for i_key in range(len(keys)):
                if words[i_word + i_key] != keys[i_key]:
                    finded = False
                    break
            if finded:
                # print words_sub
                for i in range(0, 9):
                    i1=i_word + len(keys)+i
                    word = words[i1]
                    if re.match('\d+.*', word):
                        if words[i - 1] in {'is', 'be', 'was', 'are', 'were', 'as', 'of'}:
                            credit += 1
                        if i == 0:
                            credit += 1
                        word = re.sub(r'[,~]', '', word)
                        value.append(word)
    return value, credit


# get text of one html page
def get_text(url):
    if url[len(url) - 4:len(url)] == '.pdf':
        # remove unavailable charactors
        name = re.sub(r'\/', '', url)
        name = re.sub(r'http:', '', name)
        name = re.sub(r'https:', '', name)
        name = 'pdf/' + name
        # download the pdf file if not exists
        if not os.path.isfile(name):
            urllib.urlretrieve(url, name)
        text = pdf2txt.pdf2txt(name)
    else:
        response = urllib2.urlopen(url)
        content = response.read()
        bs = BeautifulSoup(content, "html.parser")
        text = bs.get_text()
    # print text
    text = filter_tags(text)
    return text


# get url lists from a root url
def get_url_list(root_url):
    root_response = urllib2.urlopen(root_url)
    root_content = root_response.read()
    # locate the url from the html page, with BeautifulSoup library
    root_bs = BeautifulSoup(root_content, "html.parser")
    root_a = root_bs.findAll('a', recursive=True)
    url_list = []

    # remove microsoft's links for bing
    t1 = 'translator'
    t2 = 'go.microsoft'
    t = [t1, t2]
    for i in root_a:
        if i.has_attr('href'):
            h = i.attrs['href']
            if h.find('http') == 0 and h.find(t1) < 0 and h.find(t2) < 0:
                url_list.append(h)
                # print h
    return url_list


# Main Program -----------------

if __name__ == '__main__':

    # find the args
    argv = sys.argv
    argm = []
    argp = []
    pro = []
    temppro = ''
    search_str = ''
    # 1 - name of material, 2 - name of property
    arg_state = 0
    for i in range(1, len(argv)):
        if argv[i] == '-m':
            arg_state = 1
            continue
        if argv[i] == '-p':
            arg_state = 2
            continue
        # if arg_state == 1:
        #    argm.append(argv[i])
        if arg_state == 2:
            argp.append(argv[i])
            temppro = temppro + argv[i] + ' '
        search_str = search_str + '+' + argv[i]
    search_str = search_str[1:]
    pro.append(temppro)

    fineded_url = set()
    for first in range(1, 91, 10):
        # use bing to search the content
        root_url = 'http://www.bing.com/search?q=' + search_str + '&first=' + str(first)
        # print(root_url)
        url_list = get_url_list(root_url)

        for url in url_list:
            if url not in fineded_url:
                fineded_url.add(url)
                # print url[len(url)-4:len(url)]
                try:
                    text = get_text(url)
                    print find_value(text, pro), ' from ', url
                except:
                    print 'something wrong! from', url
    print 'End.'
