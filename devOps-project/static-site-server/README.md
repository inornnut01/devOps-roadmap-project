# Static Site Server

The goal of this project is to help you understand the basics of setting up a web server using a basic static site served using Nginx.

## Step 1 - Set up your linux system or server I use AWS EC5

1. Create EC2 Instance

- Choose an Amazon Linux 2023 AMI or Amazon Linux 2 AMI (both free tier eligible).
- t3.micro
- create new key pair
- create security group (allow SSH port from your IP)
- Launch instance

## Step 2 - Install and Configure Nginx

1. Connect to your EC2 instance

```bash
ssh -i key-pair.pem ec2-user@your-instance-ip
```

2. Update and install Nginx

```bash
sudo yum update -y
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

3. Create directory and set correct ownership

```bash
sudo mkdir -p /var/www/html
sudo chown -R ec2-user:ec2-user /var/www/html
sudo chmod -R 755 /var/www/html
```

4. Configure Nginx

```bash
sudo nano /etc/nginx/nginx.conf
```

In the server block, update the root directory:

```
root /var/www/html;
```

5. Restart Nginx

```bash
sudo systemctl restart nginx
```

## Step 3 - Prepare your static website

Create your static website files (HTML, CSS, JS) in a local directory.

## Step 4 - Use rsync to Update the Remote Server (Deployment Script)

1. Create deploy.sh script
2. Make the script executable

```bash
chmod +x deploy.sh
```

3. Run the deployment script

```bash
./deploy.sh
```

Static Site Server - https://roadmap.sh/projects/static-site-server
