#Grab alpine
FROM python:3.6-alpine

# Install flask
RUN pip install flask==1.1.2

# Add our code
ADD . /opt/
WORKDIR /opt

# Expose is NOT supported by Heroku
EXPOSE 8000 		

# variable
ENV var=ODOO_URL
ENV var=PGADMIN_URL

# Run the app. 		
ENTRYPOINT [ "python", "app.py" ]
