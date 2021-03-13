from typing import Counter
import requests
import os
from lxml import etree
html = requests.get("https://www.nowcoder.com/discuss")
# print(html.text)

etree_html = etree.HTML(html.text)
content = etree_html.xpath('/html/body/div[1]/div[2]/div[3]/div/div[5]/ul/li/a/img/@src')
#file_handle = open('img.txt',mode='w')
counter = 1
for each in content:
    replace = each.replace('\n', '').replace(' ', '')
    if replace == '\n' or replace == '':
        continue
    else:
        #file_handle.write(replace+'\n')
        file_handle = open('logo'+str(counter)+'.jpg',mode='wb')
        file_handle.write(requests.get(replace).content)
        file_handle.close()
        counter = counter + 1
#file_handle.close()