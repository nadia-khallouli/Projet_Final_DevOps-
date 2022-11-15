#Grab alpine
FROM python:3.6-alpine

#mainteneur email
LABEL email="lorine@gmail.com"

# Install flask
RUN pip install flask==1.1.2

# Add our code
ADD . /opt/
WORKDIR /opt

#volume
VOLUME /opt

# Expose is NOT supported by Heroku
EXPOSE 8080 		

# variable
ENV ODOO_URL="https://www.odoo.com/"
ENV PGADMIN_URL="https://www.pgadmin.org/"

# Run the app. 		
ENTRYPOINT [ "python", "app.py" ]
