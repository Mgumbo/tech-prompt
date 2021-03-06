**Author:** Michael Ball

**Purpose:** Using the Docker containerization tool, creates an environment containing a git server and a web server. The server contains a user named *admin* and a git repository also called *admin*. Shell scripts pushed to this repository will be executed, with the output of each script displayed on the server's web page.

# Included Resources
4 scripts are provided, each of which fulfills a distinct purpose in establishing (or tearing down) the environment. Each script is detailed below.

### 1. install_docker.sh
This script installs Docker Community Edition (CE) onto the machine by setting up the Docker repository, adding Docker's official GPG key, and installing the Docker CE package. Details about the installation process (for any operating system) can be found [here](https://docs.docker.com/install/linux/docker-ce/ubuntu/ "Docker Official Installation Document").

*Note: This script installs Docker only on an Ubuntu system. Please see the official Docker installation guide for installation on another operating system.*
### 2. create_assets.sh
This scripts generates all the files needed for the container to run properly. The files created are:
1. apache.crt - A unique SSL certificate.
2. apache.key - A unique private key.
3. default-ssl.conf - Configuration file for SSL.
4. index.php - The root web page for the web server.
5. Dockerfile - The file used by Docker to generate the image for the container (see _**build_and_run.sh**_).

These files are all placed in a folder called **assets** that is created in the *current* directory, and *not* the directory that the script is located in. For proper execution, this script should be run from the directory the script is located in.
### 3. build_and_run.sh
This script first builds a new Docker image named **prompt2** using the Dockerfile generated by the previous script. A rough summary of the building done by the Dockerfile is:
1. An official base image of Ubuntu is built (this will be downloaded if not already present).
2. Packages necessary for execution are installed (sudo, git, apache2, openssh-server, php, libapache2-mod-php7.0).
3. The Apache web server is configured. This includes SSL configuration.
4. A git user named *admin* is created. All user passwords on the system are changed to *empiredidnothingwrong*.
5. The git server is configured, with working copy of the repository stored on the server.
6. SSH and HTTPS ports are exposed so they can be interfaced with.
7. Web and SSH services are started, along with a shell that persists the container.

After the **prompt2** image is built, a container is initialized and run. HTTPS and SSH are mapped from the container to the local machine over their respective ports. From here, the user can begin interacting with the web and git servers (see the **Usage** section).

### 4. clean_up.sh

This script handles the proper tearing down of the environment. Any running containers are stopped and removed. Afterward, the **prompt2** image is also removed. In order to use the system again, the image will have to be built again using the _**build_and_run.sh**_ script.

# Usage
The steps to set up the system for proper utilization are as follows:

*Note: All scripts must be run as root.*
1. Download all scripts onto your local system.
2. Execute _**install_docker.sh**_ if Docker is not already installed on your system.
3. Execute _**create_assets.sh**_.
4. Execute _**build_and_run.sh**_.
5. Enter the command `git clone ssh://admin@localhost:22/home/admin/admin.git` to clone the git server's repository onto your system. This will require password input.
6. Change directory to the newly created **admin** directory.
7. Enter the command `git config user.email "<email_address>"`, where `<email_address>` is any email address. This command identifies you to the repository so that you can commit to it. *Note: If you already have a global git user configuration on your machine, you may skip this step.*

After the above steps have been completed, the web server and git server can be utilized at will. The web server can be accessed by entering the following URL in your Internet browser: `https://localhost`. The web page will execute all scripts in the repository and display their output to the user.

*Note: Until scripts are pushed to the repository, the web server will only display a default message.*

To push a script to the repository:
1. Navigate to the **admin** directory created when you cloned the repository to your system.
2. Create an executable script (i.e. one ending in _**.sh**_) with some output.
   *Note: The script __must__ be executable in order for its output to be displayed on the web page.*
4. Enter the command `git add <script>`, where `<script>` is your script file.
5. Enter the command `git commit -m "<message>"`, where `<message>` is an arbitrary commit message.
6. Enter the command `git push origin master` to push the added script to the repository. This will require password input.

After a script is committed to the repository, accessing the web page will display the output of the script after its execution. While non-script files can be added to the repository, they will not be executed or displayed on the web page.

# Cleanup
When you are finished utilizing the system, simply execute the _**clean_up.sh**_ script, and the container as well as the **prompt2** image will be removed.
