# Usage

Setup Vagrant

```sh
$ cd /path/to/this/repo
$ vagrant up
$ vagrant ssh
```

Pull templates

```sh
$ faas-cli template pull
```

Write, build and deploy your function

```sh
$ faas-cli new <your-function-name-here> --lang python3
$ vi <your-function-name-here>/handler.py
$ faas-cli build -f <your-function-name-here>.yml
$ faas-cli deploy -f <your-function-name-here>.yml
```

Access Web UI and invoke the function

- Open-FaaS: http://192.168.33.40:8080
- Prometheus: http://192.168.33.40:9090

![screenshot.png]

# Advanced Usage

Write your own template on your repository

- Create `template` directory at the root of your repository
- Place your template codes into the directory
- Examples
  - https://github.com/openfaas/templates
  - https://github.com/openfaas-incubator/python-flask-template

Pull the templates

```
$ faas-cli template pull https://github.com/<your_repo>.git
```
