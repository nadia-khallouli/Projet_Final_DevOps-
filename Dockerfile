#Grab alpine
FROM python:3.6-alpine

# Install flask
RUN pip install flask==1.1.2

# Add our code
ADD . /opt/
WORKDIR /opt

#volume
VOLUME /opt

# Expose is NOT supported by Heroku
EXPOSE 8000 		

# variable
ENV ODOO_URL="https://www.odoo.com/"
ENV PGADMIN_URL="https://www.pgadmin.org/"

# Run the app. 		
ENTRYPOINT [ "python", "app.py" ]
