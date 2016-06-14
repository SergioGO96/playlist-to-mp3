#!/usr/bin/env python
# -*- coding: utf-8 -*-
from bottle import Bottle, route, run, request, template, default_app, static_file, get, post, response, redirect 
import requests
from requests_oauthlib import OAuth1
from requests_oauthlib import OAuth2Session
from oauthlib.oauth2 import TokenExpiredError
from urlparse import parse_qs
import json

client_id='49fd8e4d566b4feb83058041921fe3f7'
client_secret='6bad2e72ce824fd3a213e823d665d00d'
youtube_servidor='AIzaSyAz9FAUJAgSEDkdE-6wsFhgc18S058wNWU'
redirect_uri = 'http://playlisttomp3-traskiloner.rhcloud.com/callback_spotify'
scope = ['playlist-read-private', 'playlist-read-collaborative']
token_url = "https://accounts.spotify.com/api/token"

def token_valido():
  token=request.get_cookie("token", secret='some-secret-key')
  if token:
    token_ok = True
    try:
      oauth2 = OAuth2Session(client_id, token=token)
      r = oauth2.get('https://www.googleapis.com/oauth2/v1/userinfo')
    except TokenExpiredError as e:
      token_ok = False
  else:
    token_ok = False
  return token_ok

@get('/login')
def LOGIN():
  if token_valido():
    redirect("/listas")
  else:
    response.set_cookie("token", '',max_age=0)
    oauth2 = OAuth2Session(client_id, redirect_uri=redirect_uri,scope=scope)
    authorization_url, state = oauth2.authorization_url('https://accounts.spotify.com/authorize/')
    response.set_cookie("oauth_state", state)
    redirect(authorization_url)

@get('/callback_spotify')
def get_token():
  oauth2 = OAuth2Session(client_id, state=request.cookies.oauth_state,redirect_uri=redirect_uri)
  token = oauth2.fetch_token(token_url, client_secret=client_secret,authorization_response=request.url)
  response.set_cookie("token", token,secret='some-secret-key')
  redirect("/listas")

@get('/listas')
def personal():
	token = request.get_cookie("token", secret='some-secret-key')
	tokens = token["token_type"]+" "+token["access_token"]
	headers = {"Accept":"aplication/json","Authorization":tokens}
	perfil = requests.get("https://api.spotify.com/v1/me", headers=headers)
	if perfil.status_code == 200:
		cuenta = perfil.json()
		cuenta = cuenta["id"]
		url_playlists = "https://api.spotify.com/v1/users/"+str(cuenta)+"/playlists"
	listas = requests.get(url_playlists, headers=headers)
	if listas.status_code == 200:
		playlists_usuario = listas.json()
	return template('listas.tpl', listas_usuario=playlists_usuario)

@route('/listas',method='POST')
def listas():
	url_lista = request.forms.get('nombre')
	token = request.get_cookie("token", secret='some-secret-key')
	tokens = token["token_type"]+" "+token["access_token"]
	headers = {"Accept":"aplication/json","Authorization":tokens}
	canciones = requests.get(url_lista, headers=headers)
	return canciones


@route('/')
def index():
    return template('index.tpl')
 

@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='static')
    
# This must be added in order to do correct path lookups for the views
import os
from bottle import TEMPLATE_PATH
TEMPLATE_PATH.append(os.path.join(os.environ['OPENSHIFT_REPO_DIR'], 'wsgi/views/')) 

application=default_app()
