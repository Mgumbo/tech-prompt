#!/bin/bash

# Ensure the user is running this script as root
if [[ $EUID > 0 ]]
then
	echo "Please run as root."
	exit
fi

mkdir assets

# Generate the SSL certificate
echo '-----BEGIN CERTIFICATE-----
MIIEMzCCAxugAwIBAgIJAP9uIZzjK6q0MA0GCSqGSIb3DQEBCwUAMIGvMQswCQYD
VQQGEwJVUzEQMA4GA1UECAwHR2VvcmdpYTEQMA4GA1UEBwwHQXVndXN0YTESMBAG
A1UECgwJV2lkZ2V0IENvMTUwMwYDVQQLDCxEZXBhcnRtZW50IG9mIEN5YmVyIENh
cGFiaWxpdGllcyBFbmdpbmVlcmluZzEOMAwGA1UEAwwFbWJhbGwxITAfBgkqhkiG
9w0BCQEWEm1iYWxsQHdpZGdldGNvLm9yZzAeFw0xODA0MTQxOTE0NTNaFw0xOTA0
MTQxOTE0NTNaMIGvMQswCQYDVQQGEwJVUzEQMA4GA1UECAwHR2VvcmdpYTEQMA4G
A1UEBwwHQXVndXN0YTESMBAGA1UECgwJV2lkZ2V0IENvMTUwMwYDVQQLDCxEZXBh
cnRtZW50IG9mIEN5YmVyIENhcGFiaWxpdGllcyBFbmdpbmVlcmluZzEOMAwGA1UE
AwwFbWJhbGwxITAfBgkqhkiG9w0BCQEWEm1iYWxsQHdpZGdldGNvLm9yZzCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOEHfmELlZODtREeGHtWzkdQpDh5
tZIwfbDGPFycM2vfi79UUosNJyyvugNNfGyAEjYp2NG9/5TwMKD+2rfdrHryAor+
ImR/0IF432u/hrdRT8CZtgWZzQKh61qjG79Vy8Cb19E9cngnTKyBul0jI7DYH2Sx
1bFbPcyQ5uXoInqAxqzlvLwUK9LA8aiNiw9w3dYY1B5Ue7N6tmktGQrfKfD5AQ5/
c/74pJUmfWbGt6LaiSk1WL9T1T4nMNBNB584K/tl1r+iynLAKx6J90G/AxDAiKFD
P4/I3sUjNrNLqvVf+BmdPNeI8NsyRsAdm0djDAWmvxO6BxlRcgN0XbfT0aECAwEA
AaNQME4wHQYDVR0OBBYEFHYf//+kxQbUqLusfVd1csV+AodDMB8GA1UdIwQYMBaA
FHYf//+kxQbUqLusfVd1csV+AodDMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEL
BQADggEBALFCL9Ul9S1KG2T99BdulNe3rpVsK0MHS4fz62KXiGNeOBmgao+wPlIP
3sGDgEviVO47apuC0ryBdh3Twik3RLe/NdiuHaiRF4njXpK+9bcrQ3Fd6HIvRjTC
eVCtidp5RbntcSOrjnq+z5PwLWsf7XwS+mp0JpeKVLJ+dEDfGZdm0B3AXJiM4y51
VQ0MEGLYFcKpUBly6c/lpZ7kUhgNnpHUPMy1eZFrJt7Cv1Z/1HlINonOX9iM5QEd
EaRl1RErIRJl6rrM6AK22iEgXbZTjcueMUX9q4LLCfd7pPBTovUGX+zpai+DaoKk
jwInI9w1xTltqoJyhy1FMRcuTzTn7Wc=
-----END CERTIFICATE-----' > assets/apache.crt

# Generate the SSL key
echo '-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDhB35hC5WTg7UR
Hhh7Vs5HUKQ4ebWSMH2wxjxcnDNr34u/VFKLDScsr7oDTXxsgBI2KdjRvf+U8DCg
/tq33ax68gKK/iJkf9CBeN9rv4a3UU/AmbYFmc0Coetaoxu/VcvAm9fRPXJ4J0ys
gbpdIyOw2B9ksdWxWz3MkObl6CJ6gMas5by8FCvSwPGojYsPcN3WGNQeVHuzerZp
LRkK3ynw+QEOf3P++KSVJn1mxrei2okpNVi/U9U+JzDQTQefOCv7Zda/ospywCse
ifdBvwMQwIihQz+PyN7FIzazS6r1X/gZnTzXiPDbMkbAHZtHYwwFpr8TugcZUXID
dF2309GhAgMBAAECggEBAKmwiPCNV8Hhc8zwsO1xTCQi/3NG9FDFGEMRebssXupd
rHgfEg+hX4UnDlInQEhhW1pUvBeN+wlJBqKhDDXSh5o+nQRLF4xJheXcTD5oMyJR
wp4uS0B19k6h42R50xa5j+gynNBAUe2hVQRQ30QUl3lnwGSiZc5US4nTSwrbvgQ5
ZWDL60oG0sVGuv/vL0Zn3C0wxYNB0xjdBQXNFHV3SF5v6QxrOgT/wZGQzfY/UoGx
i1XNKRRSua20uGPZBS5/49UKpJUgkH5TS8JMP3hE3eYtkDuqzHfIRAy50uixaB+E
/gZzvrLodTwiHfeBDL6pJ7ENTWqgk2KskD7BH/UfEPECgYEA+LrpE4PihhuL0S//
VcV4s0gk+ZSlKxJLCKTMP9IiBvLbJbQDwidRnaEsf3sx1jd3Tf6q2r9VawgXlg/0
7U38nU7YCak7H6Ce3pq4WQBfbAnyJ8gxjjJ1o3pCdfJt9q0K1EtLt7WoBsNEXjXv
TUBVHfG1/ItAlfAQ1FyHKTNS+4MCgYEA55s+rPW2S3+rUHdXp9KlNZKBkSAeOAVJ
ImMrEUcZb7YSDIVqEdv+mUtHoizn/GmwM7CEKFWXMkjiIhgBMkB23hxuVtZvbdNq
c6BvADfxovIb+/mQSyM9/n5rpLSo/Mc9Ldux0oJWEQtwNTJaNb6rGji2xYRnIrJx
MKAFBP6CgQsCgYATqcsVRN7alUDnZ7D62eKh4bkyleK81fRimYygGv+fpwFWKLYH
Wk5kdMJszZNyCO6Alvpw0qFxFbGvplFJlVm8IeiIUv2ekXcdyAN83b+tbdfb90Kb
qDeOlfK9Gk5BKwrpH4671juTVUqJXCAv7j8MX/hwH54afGEIOMxioHEV+wKBgQCR
KWhbF5YuM9K4GFTERu5taWnz/+Fw0z9HYkh4B8wVjFQ7rNMSZoRoqBo5t1OfjM53
V0c90Id3aN7y54C4clcOV1uA6d3lRAEQf5mS1X2J151ajMy3i1sryyjEjsbryCS8
PVpyymYPQNAPR4Pq85piUPGdUqMhyB3RkDoVKz+4iQKBgBvv/vYtvZKDgZPObpA1
dpjL1mzFSne1abv6+iMOb2+/fTRRoH7LI83kEv6KBVToGomJl2/OZUVJVEBzgmsy
gkaCA3/qYp2EbLl+c+PW1yHE96/c1IhJbKe1YoVf9Pxm01SjeX+5paA8FoNnUwuk
CHd7xIs43nf4C3l/yMzdn2aJ
-----END PRIVATE KEY-----' > assets/apache.key

# Generate the default SSL configuration
cat > assets/default-ssl.conf << 'end_default-ssl.conf'
<IfModule mod_ssl.c>
	<VirtualHost _default_:443>
		ServerAdmin admin@widgetco.org
		ServerName widgetco.org
		ServerAlias www.widgetco.org

		DocumentRoot /var/www/html

		# Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
		# error, crit, alert, emerg.
		# It is also possible to configure the loglevel for particular
		# modules, e.g.
		#LogLevel info ssl:warn

		ErrorLog ${APACHE_LOG_DIR}/error.log
		CustomLog ${APACHE_LOG_DIR}/access.log combined

		# For most configuration files from conf-available/, which are
		# enabled or disabled at a global level, it is possible to
		# include a line for only one particular virtual host. For example the
		# following line enables the CGI configuration for this host only
		# after it has been globally disabled with "a2disconf".
		#Include conf-available/serve-cgi-bin.conf

		#   SSL Engine Switch:
		#   Enable/Disable SSL for this virtual host.
		SSLEngine on

		#   A self-signed (snakeoil) certificate can be created by installing
		#   the ssl-cert package. See
		#   /usr/share/doc/apache2/README.Debian.gz for more info.
		#   If both key and certificate are stored in the same file, only the
		#   SSLCertificateFile directive is needed.
		SSLCertificateFile	/etc/apache2/ssl/apache.crt
		SSLCertificateKeyFile /etc/apache2/ssl/apache.key

		#   Server Certificate Chain:
		#   Point SSLCertificateChainFile at a file containing the
		#   concatenation of PEM encoded CA certificates which form the
		#   certificate chain for the server certificate. Alternatively
		#   the referenced file can be the same as SSLCertificateFile
		#   when the CA certificates are directly appended to the server
		#   certificate for convinience.
		#SSLCertificateChainFile /etc/apache2/ssl.crt/server-ca.crt

		#   Certificate Authority (CA):
		#   Set the CA certificate verification path where to find CA
		#   certificates for client authentication or alternatively one
		#   huge file containing all of them (file must be PEM encoded)
		#   Note: Inside SSLCACertificatePath you need hash symlinks
		#		 to point to the certificate files. Use the provided
		#		 Makefile to update the hash symlinks after changes.
		#SSLCACertificatePath /etc/ssl/certs/
		#SSLCACertificateFile /etc/apache2/ssl.crt/ca-bundle.crt

		#   Certificate Revocation Lists (CRL):
		#   Set the CA revocation path where to find CA CRLs for client
		#   authentication or alternatively one huge file containing all
		#   of them (file must be PEM encoded)
		#   Note: Inside SSLCARevocationPath you need hash symlinks
		#		 to point to the certificate files. Use the provided
		#		 Makefile to update the hash symlinks after changes.
		#SSLCARevocationPath /etc/apache2/ssl.crl/
		#SSLCARevocationFile /etc/apache2/ssl.crl/ca-bundle.crl

		#   Client Authentication (Type):
		#   Client certificate verification type and depth.  Types are
		#   none, optional, require and optional_no_ca.  Depth is a
		#   number which specifies how deeply to verify the certificate
		#   issuer chain before deciding the certificate is not valid.
		#SSLVerifyClient require
		#SSLVerifyDepth  10

		#   SSL Engine Options:
		#   Set various options for the SSL engine.
		#   o FakeBasicAuth:
		#	 Translate the client X.509 into a Basic Authorisation.  This means that
		#	 the standard Auth/DBMAuth methods can be used for access control.  The
		#	 user name is the `one line' version of the client's X.509 certificate.
		#	 Note that no password is obtained from the user. Every entry in the user
		#	 file needs this password: `xxj31ZMTZzkVA'.
		#   o ExportCertData:
		#	 This exports two additional environment variables: SSL_CLIENT_CERT and
		#	 SSL_SERVER_CERT. These contain the PEM-encoded certificates of the
		#	 server (always existing) and the client (only existing when client
		#	 authentication is used). This can be used to import the certificates
		#	 into CGI scripts.
		#   o StdEnvVars:
		#	 This exports the standard SSL/TLS related `SSL_*' environment variables.
		#	 Per default this exportation is switched off for performance reasons,
		#	 because the extraction step is an expensive operation and is usually
		#	 useless for serving static content. So one usually enables the
		#	 exportation for CGI and SSI requests only.
		#   o OptRenegotiate:
		#	 This enables optimized SSL connection renegotiation handling when SSL
		#	 directives are used in per-directory context.
		#SSLOptions +FakeBasicAuth +ExportCertData +StrictRequire
		<FilesMatch "\.(cgi|shtml|phtml|php)$">
				SSLOptions +StdEnvVars
		</FilesMatch>
		<Directory /usr/lib/cgi-bin>
				SSLOptions +StdEnvVars
		</Directory>

		#   SSL Protocol Adjustments:
		#   The safe and default but still SSL/TLS standard compliant shutdown
		#   approach is that mod_ssl sends the close notify alert but doesn't wait for
		#   the close notify alert from client. When you need a different shutdown
		#   approach you can use one of the following variables:
		#   o ssl-unclean-shutdown:
		#	 This forces an unclean shutdown when the connection is closed, i.e. no
		#	 SSL close notify alert is send or allowed to received.  This violates
		#	 the SSL/TLS standard but is needed for some brain-dead browsers. Use
		#	 this when you receive I/O errors because of the standard approach where
		#	 mod_ssl sends the close notify alert.
		#   o ssl-accurate-shutdown:
		#	 This forces an accurate shutdown when the connection is closed, i.e. a
		#	 SSL close notify alert is send and mod_ssl waits for the close notify
		#	 alert of the client. This is 100% SSL/TLS standard compliant, but in
		#	 practice often causes hanging connections with brain-dead browsers. Use
		#	 this only for browsers where you know that their SSL implementation
		#	 works correctly.
		#   Notice: Most problems of broken clients are also related to the HTTP
		#   keep-alive facility, so you usually additionally want to disable
		#   keep-alive for those clients, too. Use variable "nokeepalive" for this.
		#   Similarly, one has to force some clients to use HTTP/1.0 to workaround
		#   their broken HTTP/1.1 implementation. Use variables "downgrade-1.0" and
		#   "force-response-1.0" for this.
		# BrowserMatch "MSIE [2-6]" \
		#		nokeepalive ssl-unclean-shutdown \
		#		downgrade-1.0 force-response-1.0

	</VirtualHost>
</IfModule>
end_default-ssl.conf

# Generate the index of the webpage
cat > assets/index.php << 'end_index.php'
<html>
        <body>
                <?php
                        // Only worry about shell scripts in the git repo
                        foreach (glob("/home/admin/admin.git/*.sh") as $script)
                        {
                                echo "<p>";
                                echo basename("$script") . ":"; //print the script's name before the output
                                echo "<br><pre>";
                                $output = shell_exec("$script"); //execute each script and print the output
                                echo "$output<br>";
                                echo "</pre></p>";
                        } //end foreach

                        if ($script == "")
                        {
                                echo "There are no scripts in the repository.";
                        } //end if
                ?>
        </body>
</html>
end_index.php

# Generate the Dockerfile that builds the image
cat > assets/Dockerfile << 'end_Dockerfile'
# Base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update
RUN apt-get --assume-yes install sudo
RUN apt-get --assume-yes install git-core
RUN apt-get --assume-yes install apache2
RUN apt-get --assume-yes install openssh-server
RUN apt-get --assume-yes install php
RUN apt-get --assume-yes install libapache2-mod-php7.0

# Configure apache server
#	Web traffic is served over SSL with provided key and certificate
#	PHP v7.0 is enabled
#	Default webpage is replaced with provided one
RUN a2enmod ssl
RUN a2enmod php7.0
RUN mkdir /etc/apache2/ssl
COPY apache.key /etc/apache2/ssl/
COPY apache.crt /etc/apache2/ssl/
COPY default-ssl.conf /etc/apache2/sslk/
COPY index.php /var/www/html/
RUN rm /var/www/html/index.html
RUN a2ensite default-ssl.conf

# Adjust user information
#	Create admin user
#	Change any passwords to 'empiredidnothingwrong'
RUN useradd --create-home --shell /usr/bin/git-shell --groups sudo admin
RUN echo "root:empiredidnothingwrong" | chpasswd
RUN echo "admin:empiredidnothingwrong" | chpasswd

# Configure git server...
#	Anyone in sudo group (i.e. admin) can commit
#	Commits to the master branch immediately update the working copy on the server
RUN mkdir home/admin/admin.git
RUN git init home/admin/admin.git
RUN chgrp -R sudo home/admin/admin.git
RUN chmod -R g+swX home/admin/admin.git
RUN git config -f /home/admin/admin.git/.git/config receive.denyCurrentBranch updateInstead

# Expose necessary ports
EXPOSE 22
EXPOSE 443

# Execute a shell so we can interact with the container
#	Starts web server and SSH services
CMD service apache2 start && service ssh start && /bin/bash
end_Dockerfile
