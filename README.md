# A simple Docker Compose Flask-Redis Application Built by Unixcloudtraining
## Note:
> This microservice simple app consists of 2 services:
1. Frontend:
    1. HTML: Frontend app to load the final web site
1. Backend:
    1. Redis: Remote Dictionary Server which is the bwill act as a cache memory
    1. Python: For computation & making requests to the Redis DB server
## Requirements
###
1. Docker engine & Docker compose
1. Python3.x
###
## Folder content
1. `index.html` is the front-end communicating with the `app.py` file.
1. `app.py` maps the application on port `8000` is the back-end logic responsible to pass data that have been processed and shared them \
with the `index.html` file it also gets the number of times the `POST` method was passed to to the `Redis DB` server.
1. The `requirements.txt` file has the necessary dependencies for the imported modules(`redis`, `flask`) in the `app.py` file.
1. `Dockerfile` exposes the application on port `5500` and contains the instructions to build the container image.
1. `.dockerignore` will be used by the docker engine to ignore files you don't want to be present in the container image
1. `.gitignore` is a list of files you don't want to appear in your repository.
1. `compose.yaml` will be used by the `docker compose engine` to bring up your services to live.
1. `compose_state.sh` is a helper script which contents a useful and rich set of options leading to give docker compose \
some instructions to rapidedly interact with your docker compose apps.
#
## Possible issue during the implementation
> If you face the below issue when trying to access your application via the browser `http://localhost:8000` or `http://host-ip:8000`,\
just remove and replace back the following variables as it worked for me: `ip=ip, date_now=date_now, time_now=time_now`\
I am not really sure of why this error may occure and if do know please raise a PR with an update on this `README.md`
###
```sh
redis-1      | 1:M 18 Feb 2024 22:28:15.418 * Ready to accept connections tcp
flash_web-1  |  * Serving Flask app 'app.py'
flash_web-1  |  * Debug mode: on
flash_web-1  | WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
flash_web-1  |  * Running on all addresses (0.0.0.0)
flash_web-1  |  * Running on http://127.0.0.1:5000
flash_web-1  |  * Running on http://172.18.0.3:5000
flash_web-1  | Press CTRL+C to quit
flash_web-1  |  * Restarting with stat
flash_web-1  |  * Debugger is active!
flash_web-1  |  * Debugger PIN: 647-403-779
flash_web-1  | 172.18.0.1 - - [18/Feb/2024 16:30:01] "GET / HTTP/1.1" 500 -
flash_web-1  | Traceback (most recent call last):
flash_web-1  |   File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 1488, in __call__
flash_web-1  |     return self.wsgi_app(environ, start_response)
flash_web-1  |   File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 1466, in wsgi_app
flash_web-1  |     response = self.handle_exception(e)
flash_web-1  |   File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 1463, in wsgi_app
flash_web-1  |     response = self.full_dispatch_request()
flash_web-1  |   File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 872, in full_dispatch_request
flash_web-1  |     rv = self.handle_user_exception(e)
flash_web-1  |   File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 870, in full_dispatch_request
flash_web-1  |     rv = self.dispatch_request()
flash_web-1  |   File "/usr/local/lib/python3.10/site-packages/flask/app.py", line 855, in dispatch_request
flash_web-1  |     return self.ensure_sync(self.view_functions[rule.endpoint])(**view_args)  # type: ignore[no-any-return]
flash_web-1  |   File "/code/app.py", line 35, in web_app
flash_web-1  |     renderTemplate = render_template('index.html',color=color,ip=ip,clicks=clicks,time_now=time_now,date_now=date_now)
flash_web-1  | UnboundLocalError: local variable 'ip' referenced before assignment
flash_web-1  | 172.18.0.1 - - [18/Feb/2024 16:30:01] "GET /?__debugger__=yes&cmd=resource&f=style.css HTTP/1.1" 200 -
flash_web-1  | 172.18.0.1 - - [18/Feb/2024 16:30:01] "GET /?__debugger__=yes&cmd=resource&f=debugger.js HTTP/1.1" 200 -
flash_web-1  | 172.18.0.1 - - [18/Feb/2024 16:30:01] "GET /?__debugger__=yes&cmd=resource&f=console.png HTTP/1.1" 200 -
flash_web-1  | 172.18.0.1 - - [18/Feb/2024 16:30:01] "GET /?__debugger__=yes&cmd=resource&f=console.png HTTP/1.1" 304 -
```
### I hope you learned a lot 🥳