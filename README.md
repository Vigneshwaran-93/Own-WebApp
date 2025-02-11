# Own-WebApp
Set up your Own app easily

With the rise of AI, having knowledge of web app development has become essential. Web apps provide an interactive face for the solutions you've built, allowing you to showcase your work more effectively. While Streamlit is popular, it comes with some limitations in flexibility and ease of use. That's where Flask comes in – a lightweight and powerful framework for building and deploying web applications with ease.

## 🛠️ Framework & Technologies

- **Framework**: Flask
- **Language**: Python, HTML, CSS
- **Requirements**: Any computer that can run Python

## 🚀 Getting Started

This project will guide you through creating your first Flask-based web app. Whether you're a beginner or an experienced developer, this repository will provide you with the tools and understanding to develop a fully functional web application.

## 📈 Flowchart

Below is a flowchart that outlines the structure and flow of the web app:
(In progress) 

### This will be an in-depth, unconventional guide to understanding web apps.

## Web Frameworks in Python
- Flask
- Django
- Streamlit
- FastAPI
- Pyramid and so on..

# Why Flask?

Flask is a lightweight Python web framework designed for simplicity and flexibility. It's perfect for building small to medium web applications and APIs, giving developers full control over their project's structure and components.

## Pros:
- **Simple and Easy to Use**: Quick setup with minimal boilerplate code.
- **Flexible**: Allows for custom project structure and is easily extensible.
- **Strong Community**: Large ecosystem with plenty of resources and third-party libraries.

## Cons:
- **Lacks Built-in Features**: No default admin panel, authentication, etc. (unlike Django).
- **Scaling Issues**: Can be more challenging to scale for very large applications.
- **Manual Setup**: Requires more setup for advanced features.

## Detailed Structure of Flask Files Organising. 
```bash
your_flask_app/
│
├── app/                    # Contains the main application code
│   ├── __init__.py         # Initializes the Flask app
│   ├── routes.py           # Handles URL routing
│   ├── models.py           # Defines the data models (if using databases)
│   ├── forms.py            # Contains web forms (if using Flask-WTF)
│   ├── static/             # Static files like CSS, JavaScript, images
│   │   └── style.css       # Example CSS file
│   ├── templates/          # HTML templates
│   │   └── index.html      # Example HTML template
│   ├── config.py           # Configuration settings (e.g., database URL, secrets)
│   └── utils.py            # Utility functions or helpers
│
├── migrations/             # If using Flask-Migrate for database migrations
│
├── tests/                  # Unit tests for the application
│   └── test_basic.py       # Example test file
│
├── venv/                   # Virtual environment folder (optional, depending on setup)
│
├── .env                    # Environment variables (for secrets, config, etc.)
├── .gitignore              # Specifies files to ignore in git
├── requirements.txt        # Python dependencies
├── run.py                  # Entry point to run the Flask application
└── README.md               # Project documentation
```

I have created three sample Flask programs using basic templates.

## Let's Start
### 1. Install the requirements
```bash
pip install -r requirements.txt
```

### 2. Run the app
```bash
./sample_project_1/python app.py

./sample_project_3/python app.py

./sample_project_3/python app.py
```


# Port Numbers Overview

Port numbers are identifiers used to route network traffic to specific services or applications on a computer. There are **65,535** possible ports, divided into:

- **Well-Known Ports (0-1023)**: Reserved for standard services (e.g., HTTP on port 80).
- **Registered Ports (1024-49151)**: Assigned to specific applications.
- **Dynamic/Private Ports (49152-65535)**: Used for temporary connections.

While the concept of ports is the same across all operating systems, the way they're managed can differ slightly between **Windows**, **macOS**, and **Linux**—particularly regarding permission handling and firewall configuration. Flask apps generally use ports like 5000, 8080, 8000, etc. You can assign any unused port. The program will throw an error if you try to use a port number that's already in use by another running program.

### Run the app on public IP with port 80 (common HTTP port)
```bash
    if __name__ == '__main__':
        app.run(debug=False, host='0.0.0.0', port=80)
```
### Run the app on localhost with port 5000
```bash
    if __name__ == '__main__':
        app.run(debug=True, host='127.0.0.1', port=5000)
```


# What is NGINX?

[NGINX](https://www.nginx.com/) is a powerful, high-performance web server and reverse proxy server. It’s known for its scalability, speed, and ability to handle a large number of concurrent connections. 

Some common uses of NGINX:
- **Web server**: Serving static files like HTML, CSS, JS, and images.
- **Reverse proxy**: Forwarding client requests to another server (e.g., your Flask application).
- **Load balancer**: Distributing incoming traffic across multiple backend servers.
- **SSL/TLS termination**: Handling encrypted HTTPS connections.

## Flask and NGINX Integration

Flask is a Python web framework that is typically run on a WSGI server like `Gunicorn` or `uWSGI`. NGINX is often used as a reverse proxy to forward requests to the Flask application, which runs on a local server.

### Why Use NGINX with Flask?

- **Reverse Proxy**: NGINX can handle incoming HTTP requests and forward them to the Flask application, ensuring that your application only serves dynamic content.
- **Static File Handling**: NGINX serves static files (like images, JavaScript, and CSS) directly, which is much more efficient than having the Flask app do it.
- **Security**: NGINX can be configured to handle SSL/TLS encryption and perform rate limiting, blocking unwanted traffic, etc.
- **Load Balancing**: If you scale your Flask app across multiple servers, NGINX can distribute the load between them.


# Setup Domain with SSL
Before we start, point your domian to your VM IP Address. Add a 'A' record with main domain or a sub-domain.
Check if it is pointing correctly from the link below.<br>
[DNS-Checker](https://dnschecker.org/)

### Update system packages
```bash
sudo apt update
```
### Install NGINX
```bash
sudo apt install -y nginx
```

### Install Certbot
```bash
sudo apt install -y certbot python3-certbot-nginx
```

### Run domain_setup.sh
```bash
chmod +x domain_setup.sh
```
```bash
sudo ./domain_setup.sh
```
