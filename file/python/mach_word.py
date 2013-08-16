#coding=utf-8
#!/usr/bin/env python

import re
 
# 将正则表达式编译成Pattern对象
# use raw string instead
pattern = re.compile(r'(\w+\.)?\w+@(\w+.)?\w+\.com')
 
# 使用Pattern匹配文本，获得匹配结果，无法匹配时将返回None
match = pattern.match('hacker.do@163.com')
 
if match:
    # 使用Match获得分组信息
    print match.group()
 
### 输出 ###
# hello
