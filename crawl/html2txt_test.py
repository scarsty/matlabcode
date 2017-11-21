import re
import pdf2txt
import urllib
import nltk
import sys
from nltk.stem import PorterStemmer
from nltk.corpus import wordnet
from nltk.stem import WordNetLemmatizer
from nltk.corpus import words


def filter_tags(htmlstr):
    re_cdata = re.compile('//<!\[CDATA\[[^>]*//\]\]>', re.I)
    re_script = re.compile('<\s*script[^>]*>[^<]*<\s*/\s*script\s*>', re.I)  # Script
    re_style = re.compile('<\s*style[^>]*>[^<]*<\s*/\s*style\s*>', re.I)  # style
    re_br = re.compile('<br\s*?/?>')
    re_h = re.compile('</?\w+[^>]*>')
    re_comment = re.compile('<!--[^>]*-->')
    s = re_cdata.sub('', htmlstr)
    s = re_script.sub('', s)
    s = re_style.sub('', s)
    s = re_br.sub('\n', s)
    s = re_h.sub('', s)
    s = re_comment.sub('', s)
    blank_line = re.compile('\n+')
    s = blank_line.sub('\n', s)
    s = replaceCharEntity(s)
    return s


def replaceCharEntity(htmlstr):
    CHAR_ENTITIES = {'nbsp': ' ', '160': ' ',
                     'lt': '<', '60': '<',
                     'gt': '>', '62': '>',
                     'amp': '&', '38': '&',
                     'quot': '"', '34': '"', }

    re_charEntity = re.compile(r'&#?(?P<name>\w+);')
    sz = re_charEntity.search(htmlstr)
    while sz:
        entity = sz.group()
        key = sz.group('name')
        try:
            htmlstr = re_charEntity.sub(CHAR_ENTITIES[key], htmlstr, 1)
            sz = re_charEntity.search(htmlstr)
        except KeyError:
            htmlstr = re_charEntity.sub('', htmlstr, 1)
            sz = re_charEntity.search(htmlstr)
    return htmlstr


def repalce(s, re_exp, repl_string):
    return re_exp.sub(repl_string, s)


if __name__ == '__main__':
    # reload(sys)
    # sys.setdefaultencoding('utf8')
    # url='http://www.iiss.sanu.ac.rs/download/vol40_3/vol40_3_02.pdf'
    #text = pdf2txt.pdf2txt('pdf/asianjournalofchemistry21102009.weebly.comuploads29712971446026-s117-s124.pdf')

    #text = filter_tags(open("bt.txt").read())
    # for synset in wordnet.synsets('were')[0]:
        # for lemma in synset.lemmas():
            # print lemma.name()
            # print
    # print len()
    wordnet_lemmatizer = WordNetLemmatizer()
    print 'begin'
    print wordnet_lemmatizer.lemmatize('was')
    #sen = nltk.tokenize.sent_tokenize(text)

    print 1
    # print find_value(text,['dielectric constant'])
