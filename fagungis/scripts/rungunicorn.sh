#!/bin/bash                                                                                                                                                                                                 
set -e
# go in your project root
cd %(django_project_root)s
# set PYTHONPATH to cwd
export PYTHONPATH=`pwd`
# activate the virtualenv
source %(virtenv)s/bin/activate
# start gunicorn with all options earlier declared in fabfile.py
gunicorn --workers %(gunicorn_workers)s \
    --bind=%(gunicorn_bind)s \
    --user=%(django_user)s \
    --group=%(django_user_group)s \
    --log-level=%(gunicorn_loglevel)s \
    --log-file=%(gunicorn_logfile)s \
    %(project)s.wsgi:application

