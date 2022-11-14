#Grab alpine
FROM python:3.6-alpine

# Install flask
RUN pip install flask==1.1.2
# ADD ./webapp/requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip3 install --no-cache-dir -q -r /tmp/requirements.txt

# Add our code
WORKDIR /opt/

# Expose is NOT supported by Heroku
EXPOSE 8000 		

# variable
ENV var=ODOO_URL
ENV var=PGADMIN_URL

# Run the app. 		
ENTRYPOINT [ python, app.py ]