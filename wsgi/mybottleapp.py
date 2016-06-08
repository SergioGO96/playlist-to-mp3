from bottle import Bottle, route, run, request, template, default_app, static_file, get, post, response, redirect 
#import requests
#from requests_oauthlib import OAuth2Session
#from oauthlib.oauth2 import TokenExpiredError
#from urlparse import parse_qs
#import json

@route('/')
def index():
    return template('views/index.tpl')
 
@route('/<filename:path>')
def send_static(filename):
    return static_file(filename, root='static/')
    
# This must be added in order to do correct path lookups for the views
import os
from bottle import TEMPLATE_PATH
TEMPLATE_PATH.append(os.path.join(os.environ['OPENSHIFT_REPO_DIR'], 'wsgi/views/')) 

application=default_app()
