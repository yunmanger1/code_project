pwd=$( readlink -f "$( dirname "$BASH_SOURCE" )" )
OLD=$PWD
cd $pwd/../
. ./env.sh
echo $DJANGO_HOME
find . | grep locale$ | awk '{system("p=$( dirname "$1") && cd $p && echo $p && django-admin.py makemessages -l ru -e .html,.txt,.py");}'
cd $OLD
