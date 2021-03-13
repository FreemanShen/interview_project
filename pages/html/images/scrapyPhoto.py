from typing import Counter
import requests
import os
from lxml import etree
html = requests.get("https://www.nowcoder.com/discuss")
# print(html.text)

etree_html = etree.HTML(html.text)
content = etree_html.xpath('/html/body/div[1]/div[2]/div[4]/div[8]/div[2]/div/ul/li/a[1]/img/@src')
#file_handle = open('img.txt',mode='w')
counter = 1
for each in content:
    replace = each.replace('\n', '').replace(' ', '')
    if replace == '\n' or replace == '':
        continue
    else:
        #file_handle.write(replace+'\n')
        file_handle = open(str(counter)+'.jpg',mode='wb')
        file_handle.write(requests.get(replace).content)
        file_handle.close()
        counter = counter + 1
#file_handle.close()