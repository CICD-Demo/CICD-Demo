# CI/CD demo 0.1

Jim Minter <jminter@redhat.com>, 19/06/2015

### Prerequisites

* OpenShift Enterprise 3.0 GA infrastructure
* Client with oc and java-1.8.0-openjdk installed
* Permissions to add ImageStreams to the openshift project, create ServiceAccounts and add them to the privileged SCC.  These are required to start Gogs as root (temporary hack), and to allow Jenkins to bind to the host Docker socket.

### Getting started

1. Clone this repository to your client machine.

   ```bash
   $ git clone https://github.com/CICD-Demo/CICD-Demo
   ```

1. Use the ```clone.sh``` script to clone down all the service repos.  ```clone.sh -a``` will bring down all the repos for development of **CI/CD demo** as well.

   ```bash
   $ cd CICD-Demo
   $ bin/clone.sh
   ```

1. Edit the ```environment``` file as appropriate to customise your install.

1. Run the ```go.sh``` script to create the OSE projects, services, deployments, and builds, both for the TicketMonster application and for its supporting infrastructure.

   ```bash
   $ bin/go.sh
   ```

1. Wait for the initial application builds to complete, then navigate to http://monster.integration.example.com/ to see the application in the integration environment.

   The two sections below probably don't work right now due to security changes made between OpenShift Enterprise 3.0 beta 4 and 3.0 GA.  In GA, the built-in registry security has been tightened up and currently cross-project access to the registry is not available out of the box.  Need to update following instructions at https://docs.openshift.com/enterprise/3.0/dev_guide/image_pull_secrets.html .

1. ~~Navigate to http://jenkins.example.com/view/Pipeline/ and manually promote a build whose integration test is passing into the production environment.~~

1. ~~When the promotion is complete, navigate to http://monster.example.com/ to see the build in production.~~

1. Later, if you want to completely reset the environment, run ```stop.sh```.

   ```bash
   $ bin/stop.sh
   ```
