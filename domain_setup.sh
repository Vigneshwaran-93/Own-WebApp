#!/bin/bash

# Ask for the domain name
read -p "Enter your domain name (e.g., example.com): " DOMAIN_NAME

# Ask for Flask app port number
read -p "Enter the port number your Flask app is running on (e.g., 5000): " FLASK_PORT

# Create NGINX config file for the domain
CONFIG_FILE="/etc/nginx/sites-available/$DOMAIN_NAME"

echo "Creating NGINX configuration for $DOMAIN_NAME..."

sudo bash -c "cat > $CONFIG_FILE <<EOL
server {
    listen 80;
    server_name $DOMAIN_NAME;

    location / {
        proxy_pass http://127.0.0.1:$FLASK_PORT;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}

EOL"

# Enable the site by creating a symbolic link to sites-enabled
echo "Enabling site configuration..."
sudo ln -s $CONFIG_FILE /etc/nginx/sites-enabled/

# Test NGINX configuration
echo "Testing NGINX configuration..."
sudo nginx -t

# Reload NGINX to apply changes
echo "Reloading NGINX..."
sudo systemctl reload nginx

# Run Certbot to obtain an SSL certificate for the domain
echo "Obtaining SSL certificate for $DOMAIN_NAME..."
sudo certbot --nginx -d $DOMAIN_NAME --non-interactive --agree-tos --email your-email@example.com

# Set up automatic certificate renewal
echo "Setting up automatic SSL certificate renewal..."
sudo systemctl enable certbot.timer
sudo systemctl start certbot.timer

# Final message
echo "NGINX and Certbot setup complete. Your Flask app should be accessible at https://$DOMAIN_NAME."
