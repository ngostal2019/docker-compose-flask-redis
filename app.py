import random
import socket
import redis
import time
from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def web_app():
    cache = redis.Redis(host='redis', port=6379, decode_responses=True)
    color = "#" + ''.join([random.choice('0123456789ABCDEF') for _ in range(6)])

    if request.method == 'POST':
        cache.incr('clicks')

    clicks = cache.get('clicks')

    if clicks is None: # if user do not click
        clicks = 0
    else:
        clicks = clicks
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        get_time = time.localtime()
        date_now = time.strftime('%B %d %Y')
        time_now = time.strftime('%I:%M:%S %p', get_time)
        try:
            s.connect(('192.255.255.255', 1)) # IP doesn't need to be reachable
            ip = s.getsockname()[0]
        except:
            ip = '127.0.0.1'
        finally:
            s.close()

        renderTemplate = render_template('index.html',color=color,clicks=clicks,ip=ip,date_now=date_now,time_now=time_now)
    return renderTemplate