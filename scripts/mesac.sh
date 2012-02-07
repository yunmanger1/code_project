find . | grep locale$ | awk '{system("p=$( dirname "$1") && cd $p && django-admin.py compilemessages");}'
