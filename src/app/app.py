import os
import datetime
from flask import Flask, render_template, request
import requests

# create Flask-object
app = Flask(__name__, static_url_path='', template_folder='templates', static_folder='../design/')

@app.errorhandler(Exception)
def server_error(err):
    app.logger.error(f"App error: {err}")
    return "Forbidden", 403

@app.errorhandler(ZeroDivisionError)
def server_error(err):
    app.logger.error(f"Server error: {err}")
    return "Cannot divide by 0", 500

def check_mailex(number, headers, language="EN", add_post_office_info="true"):
    """Use api checkmailex and get json with information about parcel by number

    Args:
        number (str): parcel number, f.e. 12345 or CP12345PL
        headers (dict): dict with headers from browser
        language (str): language of response - EN or PL
        add_post_office_info (str): add or not info about post office to response - true or false

    Returns:
        json: json with information about parcel
    """
    # api url from emonitoring site
    url = 'https://uss.poczta-polska.pl/uss/v1.0/tracking/checkmailex'
    
    # standard api key from poland post site
    API_KEY = "BiGwVG2XHvXY+kPwJVPA8gnKchOFsyy39Thkyb1wAiWcKLQ1ICyLiCr"\
        "xj1+vVGC+kQk3k0b74qkmt5/qVIzo7lTfXhfgJ72Iyzz05wH2XZI6AgXVDciX"\
        "7G2jLCdoOEM6XegPsMJChiouWS2RZuf3eOXpK5RPl8Sy4pWj+b07MLg=.Mjg0"\
        "Q0NFNzM0RTBERTIwOTNFOUYxNkYxMUY1NDZGMTA0NDMwQUIyRjg4REUxMjk5N"\
        "DAyMkQ0N0VCNDgwNTc1NA==.b24415d1b30a456cb8ba187b34cb6a86"

    # add headers for request
    headers.update({
        "Content-Type": "application/json; charset=utf-8",
        "API_KEY": API_KEY,
    })

    # add parameters to query string
    query_string = {"language":language,"number":number,"addPostOfficeInfo":add_post_office_info}

    response = requests.post(url, json=query_string, headers=headers)
    data = response.json()
    return data


def add_indexes_to_events(data):
    if data.get("mailInfo"):
        if data.get("mailInfo").get("events"):
            for index, event in enumerate(reversed(data.get("mailInfo").get("events"))):
                event["id"] = index        
    return data
    
def change_date_format(data):
    if data.get("mailInfo").get("dispatchDate"):
        data["mailInfo"]["dispatchDate"] = data.get("mailInfo").get("dispatchDate").replace('T',' ')

    for event in data.get("mailInfo").get("events"):
        if event.get("time"):
            event["time"] = event.get("time").replace('T',' ')
    return data

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/search')
def search():
    """Main function 
    - get and check parcel number
    - add headers to next request 
    - checks
    - render html - jinja

    Returns:
        str: rendered html based on index.html template
    """
    # get parcel number argument
    number = request.args.get('number')

    # add headers
    headers = {}
    headers['User-Agent'] = request.headers.get('User-Agent')
    headers['Cookie'] = request.headers.get('Cookie')
    headers['Accept-Encoding'] = request.headers.get('Accept-Encoding')
    headers['Accept-Language'] = request.headers.get('Accept-Language')

    # check number in get-request
    if number:
        data = check_mailex(number, headers)
        # check status of parcel - if mailStatus == -1 - parcel doesn't exist, else - exist
        if data.get('mailStatus') == -1:
            data = None
    else:
        data = None

    data = add_indexes_to_events(data)
    data = change_date_format(data)

    return render_template('results.html', data=data)


if __name__ == '__main__':
    # ----Remainder of Code----
    port = int(os.environ.get('PORT', 5000))
    app.run(host= '0.0.0.0', port = port)
