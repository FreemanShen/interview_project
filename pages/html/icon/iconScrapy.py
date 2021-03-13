from typing import Counter
import requests
import os
from lxml import etree
html = requests.get("https://www.nowcoder.com/")
# print(html.text)

etree_html = etree.HTML(html.text)
content = etree_html.xpath('/img/@src')
#file_handle = open('img.txt',mode='w')
print(content)
counter = 1
for each in content:
    replace = each.replace('\n', '').replace(' ', '')
    if replace == '\n' or replace == '':
        continue
    else:
        #file_handle.write(replace+'\n')
        file_handle = open('icon'+str(counter)+'.png',mode='wb')
        file_handle.write(requests.get(replace).content)
        file_handle.close()
        counter = counter + 1
#file_handle.close()
for each in content:
    print(each)