from flask import Blueprint, request, jsonify, make_response
import json
from src import db

# User blueprint
users = Blueprint('users', __name__)


@users.route('/test', methods=['GET'])
def test_endpoint():
    return ('<h1>Hello from your web app!!</h1>')
